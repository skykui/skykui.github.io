{% if page.comments && theme.gitalk.enable %}

  <link rel="stylesheet" href="/lib/gitalk/gitalk.css">

  <script src="/lib/gitalk/gitalk.min.js"></script>

   <script type="text/javascript">
        var gitalk = new Gitalk({
          clientID: '{{ theme.gitalk.ClientID }}',
          clientSecret: '{{ theme.gitalk.ClientSecret }}',
          repo: '{{ theme.gitalk.repo }}',
          owner: '{{ theme.gitalk.owner }}',
          admin: ['{{ theme.gitalk.adminUser }}'],
          id: {{ theme.gitalk.ID }},
          perPage: {{ theme.gitalk.perPage }},
          pagerDirection: '{{ theme.gitalk.pagerDirection }}',
          createIssueManually: {{ theme.gitalk.createIssueManually }},
          distractionFreeMode: {{ theme.gitalk.distractionFreeMode }}
        })
        gitalk.render('gitalk-container')           
       </script>
{% endif %}
