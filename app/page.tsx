import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"

import CardBody from "@/components/content/CardBody";
import RefreshButton from "@/components/footer/RefreshButton";

export default function Home() {
  return (
    <div className="h-screen flex items-center justify-center">
      <div className="md:w-1/2">
        <Card className="h-full flex flex-col">
          <CardHeader>
            <CardTitle>Countries API</CardTitle>
            <CardDescription>REST API for breaking down the restcountries.com API in NextJS</CardDescription>
          </CardHeader>
          <CardContent className="grow p-6 flex flex-col">
            <CardBody/>
          </CardContent>
          <CardFooter className="py-2">
            <RefreshButton/>
          </CardFooter>
        </Card>
      </div>
    </div>
  );
}
