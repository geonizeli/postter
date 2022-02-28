# README

## Planning

### Question for the Product Manager
 - We will allow user to use @mentioning only in the beginning of text?
 - What do you think about create an extensive architecture to support new features, creating a relation of posts and users through Mention entity?

### Implementation
  1. Improve Post entity scopes, moving `post`, `repost`, `quoted_post` and `reply` to `kind enum column`, becase of the static characteristic of posts a precomputed status will be perfect to simplify queries.
  2. Rename `Post#quoted_post` to `Post#reference`
  3. Add a reply route to post, example `POST /posts/1/replys`, when creating a reply save post with kind
  4. When quering a `reply`, the frontend will concat orignal post owner username with post content

## Self-critique and scaling

  -
  -
  -