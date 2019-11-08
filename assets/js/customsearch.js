
handleSearchQuery = function (query) {
    var url = "https://search-sciwiki-search-0-f7ntx2mpc5g6yohp6dtiwzsdiy.us-west-2.es.amazonaws.com/sciwiki0/_search";

    var data = {
        _source: ['title'],
        highlight: { fields: { content: {} } },
        size: 100,
        query: { match_phrase: { content: query } }
    };

    $.ajax({
        method: 'POST',
        url: url,
        data: JSON.stringify(data),
        mimeType: "application/json",
        contentType: 'application/json; charset=utf-8'
    }).done(function (data) {
        // TODO be less ugly
        var issue = "<br><span>Didn't find what you were looking for? File an <a href='https://github.com/FredHutch/wiki/issues/new?template=request-for-content.md'>issue</a>.</span>";
        var searchResults = $('<div id="searchresults"  style="margin-top: 10px; margin-bottom: 10px; margin-left: 80px; margin-right: 80px;" />').appendTo('#searchresults');
        if (data['hits']['total'] == 0) {
            $("#searchresults").html("No results for '" + query + "'." + issue);
        } else {
            // TODO if we got more than 100 results we should indicate that we are only showing the 1st 100
            // is pagination worth it?
            var hitsFound = data['hits']['total'];
            var hitsPerPage = data['hits']['hits'].length;
            var html = "";
            html += "<span>Found " + hitsFound + " matches for '" + query + "'.</span><br/>\n";

            for (var i = 0; i < hitsPerPage; i++) {
                var hit = data['hits']['hits'][i];
                html += "<br/>\n";
                html += '<a href="' + hit['_id'] + '">';
                html += hit['_source']['title'];
                html += "</a>";
                html += "<br/>\n";
                html += '<span>' + hit['highlight']['content'].join("...") + '</span><br/>\n';

            }
            html += issue;
            $("#searchresults").html(html);
        }

    }).fail(function (e) {
        console.log("in fail");
        console.log(e);
    });

}

$(function () {
    // $(".search__toggle").click(function () {
    //     $("#searchbox").remove();
    //     $("#searchresults").remove();
    //     var searchDiv = $('<input type="search" id="searchbox" aria-placeholder="Type search term(s) and press Enter..." class="search-input" tabindex="-1" placeholder="Type search term(s) and press Enter..." style="margin-top: 20px; margin-bottom: 20px; margin-left: 80px; margin-right: 20x; width: 50%;"/>').appendTo('body');
    //     $("#searchbox").focus();
    // });

    $('body').on('keydown', '#searchbox', function (event) {
        if (event.keyCode == 13) {
            var searchResultsUrl = window.location.href.replace("/search/", "/searchresults/?query=" + encodeURIComponent($("#searchbox").val()));
            window.location.href = searchResultsUrl;
            //handleSearchQuery($("#searchbox").val());
        }
    });


});



