
handleSearchQuery = function (query) {
    // TODO come up with a more permanent solution than jsonp.afeld.me?
    // deploy it ourselves: https://github.com/afeld/jsonp#setup
    var url = "https://wiki-json-proxy.fhcrc.org/?callback=?&url=https://search-sciwiki-0-miwsjq2efeohp7oftsafh2ywa4.us-west-2.cloudsearch.amazonaws.com/2013-01-01/search?q=";
    url += encodeURI(query);
    url += "%26return=title";
    url += "%26highlight.content==%7B%7D"
    url += "%26size=100";
    $.getJSON(url, function (data, b, c) {
        // TODO be less ugly
        var issue = "<br><span>Didn't find what you were looking for? File an <a href='https://github.com/FredHutch/wiki/issues/new/choose'>issue</a>.</span>";
        var searchResults = $('<div id="searchresults"  style="margin-top: 10px; margin-bottom: 10px; margin-left: 80px; margin-right: 80px;" />').appendTo('body');
        if (data['hits']['found'] == 0) {
            $("#searchresults").html("No results for '" + query + "'." + issue);
        } else {
            // TODO if we got more than 100 results we should indicate that we are only showing the 1st 100
            // is pagination worth it?
            var hitsFound = data['hits']['found'];
            var hitsPerPage = data['hits']['hit'].length;
            var html = "";
            html += "<span>Found " + hitsFound + " matches for '" + query + "'.</span><br/>\n";

            for (var i = 0; i < hitsPerPage; i++) {
                var hit = data['hits']['hit'][i];
                html += "<br/>\n";
                html += '<a href="' + hit['id'] + '">';
                html += hit['fields']['title'];
                html += "</a>";
                html += "<br/>\n";
                html += '<span>' + hit['highlights']['content'] + '</span><br/>\n';

            }
            html += issue;
            $("#searchresults").html(html);
        }
    }).fail(function () {
        console.log("in error function");
    });
}

$(function () {
    $(".search__toggle").click(function () {
        $("#searchbox").remove();
        $("#searchresults").remove();
        var searchDiv = $('<input type="search" id="searchbox" aria-placeholder="Type search term(s) and press Enter..." class="search-input" tabindex="-1" placeholder="Type search term(s) and press Enter..." style="margin-top: 20px; margin-bottom: 20px; margin-left: 80px; margin-right: 20x; width: 50%;"/>').appendTo('body');
        $("#searchbox").focus();
    });

    $('body').on('keydown', '#searchbox', function (event) {
        if (event.keyCode == 13) {
            handleSearchQuery($("#searchbox").val());
        }
    });


});



