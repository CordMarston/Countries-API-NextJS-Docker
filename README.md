
# Country, Region, Languages API

This REST API allows you to perform a few simple API queries that are based on restcountries.com - The project was built with NextJS, Prisma, Tailwind & SQLite. 

The available API routes are 

**GET /api/countries** - Retrieve a list of countries with pagination.

**GET /api/countries/:code** - Retrieve details for a specific country by its
code.

**GET /api/regions** - Retrieve a list of regions and the countries within each
region.

**GET /api/languages** - Retrieve a list of languages spoken and the countries
where they are spoken.

**Approach Description:** I tried to go at this by implementing my own NextJS frontend so that I wouldn't have to use third parties to query the API. I wanted to make the front end sort of server as the documentation.

**Interesting / Significant:** I normally use MySQL with Laravel or some other form of database and SQL processer. I found out just how complicated nested relations can be using Prisma. The upserts / foreign key constraints really complicate things and I don't know if I would choose Prisma again.

**Pleased With:** I am pleased with the simplicity of the front-end and the speed. NextJS caching really simplifies and caching process when querying anything from the /api/ folder.

**Needs More Time:** Documentation, upsert the database instead of dropping when refreshing the backend. I need to add filters to each of the routes.