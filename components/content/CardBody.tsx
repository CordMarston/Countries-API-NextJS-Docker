"use client";
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
    SelectGroup,
    SelectLabel,
} from "@/components/ui/select"
  
import { Button } from "@/components/ui/button";
import { ChangeEvent, useState } from 'react';
import { Input } from "@/components/ui/input"

export default function CardBody() {
    
    const [apiRoute, setApiRoute] = useState('');
    const [apiResponse, setApiResponse] = useState('');
    const [pageNumber, setPageNumber] = useState(1);
    const [countryCode, setCountryCode] = useState('');
    const [sortDirection, setSortDirection] = useState('asc');

    const queryApi = async () => {
        let url = apiRoute;
        if(url == '/api/countries') {
            url = url+'?page='+pageNumber+'&direction='+sortDirection;
        } else if(url == '/api/countries/') {
            url = url+countryCode;
        }
        const getRoute = await fetch(url);


        if (!getRoute.ok) {
            // This will activate the closest `error.js` Error Boundary
            throw new Error('Failed to fetch data')
          }
        
        let response = await getRoute.json();
        setApiResponse(response);
    }

    const changePage = (e: ChangeEvent<HTMLInputElement>) => {
        const val = Number(e.target.value)
        if (Number.isInteger(val) && val >= 0) {
            setPageNumber(val)
        }
    }

    const changeCountryCode = (e: ChangeEvent<HTMLInputElement>) => {
        setCountryCode(e.target.value);
    }

    return (
        <>
        <div className="flex gap-2">
            <div className="grow justify-stretch">
                <Select onValueChange={setApiRoute}>
                    <SelectTrigger className="w-full min-w-20">
                        <SelectValue placeholder="Select a URL" />
                    </SelectTrigger>
                    <SelectContent>
                        <SelectGroup>
                            <SelectLabel>GET Routes</SelectLabel>
                            <SelectItem value="/api/countries">/api/countries</SelectItem>
                            <SelectItem value="/api/countries/">/api/countries/:code</SelectItem>
                            <SelectItem value="/api/regions">/api/regions</SelectItem>
                            <SelectItem value="/api/languages">/api/languages</SelectItem>
                        </SelectGroup>
                    </SelectContent>
                </Select>
            </div>
            {apiRoute == '/api/countries' &&
                <div className="flex items-center gap-x-2">
                    <Input type="number" placeholder="Page" min="1" step="1" value={pageNumber} onChange={changePage}/>
                
                <Select value={sortDirection} onValueChange={setSortDirection}>
                    <SelectTrigger>
                        <SelectValue placeholder="Sort Direction" />
                    </SelectTrigger>
                    <SelectContent>
                        <SelectGroup>
                            <SelectItem value="asc">ASC</SelectItem>
                            <SelectItem value="desc">DESC</SelectItem>
                        </SelectGroup>
                    </SelectContent>
                </Select>
                </div>
            }
            {apiRoute == '/api/countries/' &&
                 <div className="flex items-center">
                    <Input type="text" placeholder="Code" value={countryCode} onChange={changeCountryCode}/>
                </div>
            }
            <div className="flex items-center">
                <Button onClick={queryApi}>
                    Go
                </Button>
            </div>
        </div>
        <div className="grow py-2">
            <div className="bg-neutral-100 h-96 overflow-auto">
                <pre>{JSON.stringify({'response': apiResponse}, null, 3)}</pre>
            </div>
        </div>
        </>
    )
}