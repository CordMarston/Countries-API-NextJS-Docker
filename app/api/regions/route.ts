import { PrismaClient } from '@prisma/client'
import { NextRequest } from 'next/server';

const prisma = new PrismaClient()

export async function GET(req:NextRequest) {
    let direction = req.nextUrl.searchParams.get("sort");
    let sortDirection: 'asc' | 'desc';
    if(direction == 'desc') {
      sortDirection = 'desc';
    } else {
      sortDirection = 'asc';
    }
    const regions = await prisma.region.findMany({
        orderBy: {
            region_name: sortDirection,
        },
        include: {
            country: {
                select: {
                    country:{
                       select: {
                        country_name:true
                       }
                    }
                }
            }
        }
    })

    // Flattening the nested objects into a single array
    const flattenedRegions = regions.map(region => {
        const { country, ...rest } = region;
        return {
            ...rest,
            countries: country.map(({ country }) => country.country_name)
        }
    })


    return new Response(JSON.stringify(flattenedRegions), {status: 200})
}