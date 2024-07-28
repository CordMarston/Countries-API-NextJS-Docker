import { PrismaClient } from '@prisma/client'
import { NextRequest } from 'next/server';

const prisma = new PrismaClient()

export async function GET(req:NextRequest, { params }: { params: { code: string } }) {

    const country = await prisma.country.findFirst({
        where: {
            code: params.code,
        },
        include: {
            detail: {
                select: {
                    latlng:true,
                    population:true
                }
            }
        }
    })
    

    return new Response(JSON.stringify(country), {status: 200})
}