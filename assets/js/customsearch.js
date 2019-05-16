
handleSearchQuery = function (query) {
    // TODO come up with a more permanent solution than jsonp.afeld.me?
    // deploy it ourselves: https://github.com/afeld/jsonp#setup
    var url = "https://jsonp.afeld.me/?callback=?&url=https://search-sciwiki-0-miwsjq2efeohp7oftsafh2ywa4.us-west-2.cloudsearch.amazonaws.com/2013-01-01/search?q=";
    url += encodeURI(query);
    url += "%26return=title";
    url += "%26highlight.content={}"
    url += "%26size=100";
    $.getJSON(url, function (data, b, c) {
        // TODO be less ugly
        var searchResults = $('<div id="searchresults"  style="margin-top: 100px; margin-bottom: 100px; margin-left: 80px; margin-right: 150px;" />').appendTo('body');
        if (data['hits']['found'] == 0) {
            $("#searchresults").html("No results for '" + query + "'.");
        } else {
            // TODO if we got more than 100 results we should indicate that we are only showing the 1st 100
            // is pagination worth it?
            var hitsFound = data['hits']['found'];
            var hitsPerPage = data['hits']['hit'].length;
            var html = "";
            html += "<span>Found " + hitsFound + " matches for '" + query + "'.</span><br/>&nbsp;<br/>\n";

            for (var i = 0; i < hitsPerPage; i++) {
                var hit = data['hits']['hit'][i];
                html += "<br/>\n";
                html += '<a href="' + hit['id'] + '">';
                html += hit['fields']['title'];
                html += "</a>";
                html += "<br/>\n";
                html += '<span>' + hit['highlights']['content'] + '</span><br/>\n';

            }
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
        var searchDiv = $('<input type="search" id="searchbox" aria-placeholder="Enter your search term..." class="search-input" tabindex="-1" placeholder="Enter your search term..."/>').appendTo('body');
        $("#searchbox").focus();
    });

    $('body').on('keydown', '#searchbox', function (event) {
        if (event.keyCode == 13) {
            handleSearchQuery($("#searchbox").val());
        }
    });


});



