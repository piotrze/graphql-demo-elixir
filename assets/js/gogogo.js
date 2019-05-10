import ApolloClient from "apollo-client";
import {createHttpLink} from "apollo-link-http";
import {hasSubscription} from "@jumpn/utils-graphql";
import {InMemoryCache} from "apollo-cache-inmemory";
import {split} from "apollo-link";
import absintheSocketLink from "./absinthe-socket-link";
import gql from 'graphql-tag';

const link = split(
  operation => hasSubscription(operation.query),
  absintheSocketLink,
  createHttpLink({uri: "http://platform-e22e.lvh.me:3000/api/graph"})
);

const client = new ApolloClient({
  link,
  cache: new InMemoryCache()
});

console.log('hohoho');
client.query({
  query: gql`
{
  instance{ name }
}`
})
  .then(data => console.log(data.data))
  .catch(error => console.error(error));


client.subscribe({
  query: gql`
  subscription {
    links_feed{
      url
    }
  }
`
}).subscribe({
  next(data) { console.log(data.data.links_feed); },
  error(err) { console.error('err', err); },
});
