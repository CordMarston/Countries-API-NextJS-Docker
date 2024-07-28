import { PrismaClient } from '@prisma/client'
import { NextRequest } from 'next/server';

const prisma = new PrismaClient()

export async function GET(req:NextRequest, { params }: { params: { code: string } }) {

    const languages = await prisma.language.findMany({
        include: {
            detail: {
                select: {
                    detail: {
                        select: {
                            country:true
                        }
                    }
                }
            }
        }
    });

    // Flattening the nested objects into a single array
    const flattenedLanguages = languages.map(language => {
        const { detail, ...rest } = language;
        return {
            ...rest,
            countries: detail.map(({ detail }) => detail.country.country_name)
        }
    })

    return new Response(JSON.stringify(flattenedLanguages), {status: 200})
}