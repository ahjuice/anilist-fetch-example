require "pp"
require_relative "anilist_api"

AnimeQuery = AnilistAPI::Client.parse <<-'GRAPHQL'
  query ($page: Int, $perPage: Int) {
    Page (page: $page, perPage: $perPage) {
      pageInfo {
        total
        currentPage
        lastPage
        hasNextPage
        perPage
      }
      media (type: ANIME) {
        id
        title {
          romaji
          english
          native
        }
      }
    }
  }
GRAPHQL

result = AnilistAPI::Client.query(AnimeQuery, variables: {page: 1, perPage: 10})

pp result.original_hash
