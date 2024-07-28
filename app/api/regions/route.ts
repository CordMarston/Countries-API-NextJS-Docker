import { PrismaClient } from '@prisma/client'
import { NextRequest } from 'next/server';
import { FaObjectGroup } from 'react-icons/fa';

const prisma = new PrismaClient()

export async function GET(req:NextRequest, { params }: { params: { code: string } }) {

    const regions = await prisma.region.findMany({
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