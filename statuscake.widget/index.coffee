STATUSCAKE_API_KEY = 'insert your API key here'
STATUSCAKE_USERNAME = 'insert your username here'

command: "curl -sS -H 'API: #{ STATUSCAKE_API_KEY }' -H 'Username: #{ STATUSCAKE_USERNAME }' -X GET https://app.statuscake.com/API/Tests/"
refreshFrequency: 600000  # Milliseconds between calls


render: -> """
<div>
  <table></table>
  <style>
    @-webkit-keyframes blink {
       from { opacity: 1; }
       to { opacity: 0.2; }
    }
  </style>
</div>
"""

update: (output, domEl) ->
  statuses = JSON.parse(output)
  table = $(domEl).find('table')

  table.html('')

  renderStatus = (status) ->
    """
    <tr>
      <td class="status #{ status.Status }"><div class="disc"></div></td>
      <td class="sitename">#{ status.WebsiteName }</td>
    </tr>
    """

  for status in statuses
    table.append renderStatus(status)


style: """
bottom: 290px
left: 40px
color: #ffffff
margin: 0 auto
font-family: Helvetica Neue, Sans-serif
font-smoothing: antialias
font-weight: 300
font-size: 16px
line-height: 27px

.status
  padding: 0 9px 0 0

.disc
  width: 12px
  height: 12px
  border-radius: 50%

.Up .disc
  background-color: rgba(0,240,0,0.6)

.Down .disc
  background-color: rgba(255,0,0,1)
  animation: blink 2s cubic-bezier(0.950, 0.050, 0.795, 0.035) infinite alternate

"""
