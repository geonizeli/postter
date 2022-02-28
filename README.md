# README

## Setup
  1. Run setup script (docker) `./scripts/setup`
  2. Execute seeds rake with `docker-compose run --rm web rails db:seed`
  3. Start project with `docker-compose up`
  4. Seed routes documentation `http://localhost:3000/rails/info/routes`

## Planning

### Question for the Product Manager
 - We will allow user to use @mentioning only in the beginning of text?
 - What do you think about create an extensive architecture to support new features, creating a relation of posts and users through Mention entity?

### Implementation
  1. Improve Post entity scopes, moving `post`, `repost`, `quoted_post` and `reply` to `kind enum column`, becase of the static characteristic of posts a precomputed status will be perfect to simplify queries.
  2. Rename `Post#quoted_post` to `Post#reference`
  3. Add a reply route to post, example `POST /posts/1/replys`, when creating a reply save post with kind
  4. When quering a `reply`, the frontend will concat orignal post owner username with post content

## Critique
  - If I had more time I am certainly using it improve PostsQueryResolverSerivce#filter_by_terms to be more simply, also will give a time to implement cursor based pagination and [json:api specifications](https://jsonapi.org/)
  - No cache implemented, this could be the first problem, for a social network with this I will certainly migrate the application for GraphQL (with Relay), this will give flexibility to frontend and maybe a mobile developer to only ask what they need, using less bandwidth, and building a consistent frontend side cache. We could use several infras, azure, aws and etc. I would normally choose AWS for ease and convenience, but scope and needs are important in deciding. Considering that we want to be resilient to governments interventions, it would be significant to have an infrastructure of our own.


# Timing
## Coding
- 2 hours at Feb 28
- 4 hours at Feb 29

## Planning
- 8 minutes at Feb 29

## Critique
- ~ 30 minutes at Feb 29
