"use client";
import { SlRefresh } from "react-icons/sl";
import { Button } from "@/components/ui/button";
import { useState } from 'react';

export default function RefreshButton() {
    
    const [buttonMessage, setButtonMessage] = useState('Refresh Database');
    const [loading, setLoading]  = useState(false);

    const refreshBackend = async () => {
        setLoading(true);
        setButtonMessage('Refreshing');
        const res = await fetch('/api/countries/refresh/').then((data) => {
            setLoading(false)
            setButtonMessage('Refreshed at '+new Date().toLocaleString());
        })
    }

    return (
        <Button onClick={refreshBackend} disabled={loading}>
            <SlRefresh className={`mr-2 h-4 w-4` + (loading ? ' animate-spin' : '')} /> {buttonMessage}
        </Button>
    )
}