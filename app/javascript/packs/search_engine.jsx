// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.


import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import 'react-instantsearch-theme-algolia/style.scss';
import {InstantSearch, Hits, SearchBox, Highlight, RefinementList, CurrentRefinements, createConnector} from 'react-instantsearch/dom';
const VirtualMenu = connectMenu(() => null);
import {connectMenu} from 'react-instantsearch/connectors';
const rp = this;
const player =  $.ajax('/current_user').done(function(result){return((result));});


const App = () =>
  <InstantSearch
    appId='GFZSGDPOU8'
    apiKey='5613713adbb447d04c20fa1c12fcafe4'
    indexName="Receipt"
  >
  <VirtualMenu attributeName="userid" defaultRefinement={decodeURIComponent(window.location.search.substring(1)).split('=').pop()} />

    {/* Search widgets will go there */}
    <Search />

  </InstantSearch>

  function Search() {
    return (
      <div className="container">
        <SearchBox autoFocus={true}
          translations={{

            placeholder: 'Search Through Your Receipts',
          }}/>
        <Hits hitComponent={Product} />
      </div>
    );
  }
  function Product({hit}) {
  return (
    <div style={{marginTop: '30px'}}>
      <div id="imagefloat"><a href={hit.address} ><img src={hit.address}  height="200" width="200"/ ></a></div>
          <div className="hit-name" id="textresponseid">
            <Highlight attributeName="text_response" hit={hit} />
          </div>
    </div>
  );
};

// Needed only if your js app doesn't do it already.
// Create-react-app does it for you



document.addEventListener('turbolinks:load', () => {
  ReactDOM.render(
    <App />,
    document.getElementById('searchengine'),
  )
})
