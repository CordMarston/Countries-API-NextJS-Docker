import { PrismaClient } from '@prisma/client'
import { NextRequest } from 'next/server';

const prisma = new PrismaClient()

export async function GET(req:NextRequest) {

    let page = req.nextUrl.searchParams.get("page");
    let direction = req.nextUrl.searchParams.get("sort");
    let sortDirection: 'asc' | 'desc';
    if(direction == 'desc') {
      sortDirection = 'desc';
    } else {
      sortDirection = 'asc';
    }
    let skipRecords = 0;
    if(page) {
      skipRecords = (parseInt(page)-1) * 20
    } 

    const results = await prisma.country.findMany({
        skip: skipRecords,
        take: 20,
        orderBy: {
          country_name: sortDirection,
        },
      })

    return new Response(JSON.stringify(results), {status: 200})
}