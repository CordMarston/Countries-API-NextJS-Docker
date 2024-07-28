// import fs from 'fs';
import { PrismaClient, PrismaPromise } from '@prisma/client'
import { exec } from 'child_process';
import * as util from 'util';

const execPromisify = util.promisify(exec);

const prisma = new PrismaClient()

export async function GET(request: Request) {

  const res = await fetch('https://restcountries.com/v3.1/all');
  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }
 
  const data = await res.json();
  
  // Delete all  prior to re-entering data (could be updated with upserts just no time)
  execPromisify('npx prisma migrate reset --force --skip-seed');

  for(let cont of data) {
    let language_name:string = "";
    if(cont.languages) {
      let language_values: Array<string> = Object.values(cont.languages);
      if(language_values.length > 0) {
        language_name = language_values[0];
      }
    }
    const country = await prisma.country.create({
      data: {
        country_name: cont.name.common,
        code: cont.cca2,
        detail: {
          create: {
            latlng: "["+cont.latlng+"]",
            population: cont.population,
            language: {
              create: [
                {
                  language: {
                    connectOrCreate: {
                      where: {
                        language_name: language_name
                      },
                      create: {
                        language_name: language_name
                      },
                    },
                  },
                },
              ],
            },
          }
        },
        region: {
          create: [
            {
              region: {
                connectOrCreate: {
                  where: {
                    region_name: cont.region
                  },
                  create: {
                    region_name: cont.region
                  },
                },
              },
            },
          ],
        },
      },
    })
  };
  return new Response('Done', {status: 200})
}