# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save', 'r': 'session-load', 'rw': 'session-load work', 'ww': 'session-save work'}

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = 'powderblue'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = 'black'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = 'powderblue'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = 'black'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = 'gold'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = 'navy'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = 'gold'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = 'navy'

# The directory to save downloads to. If unset, a sensible os-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '/home/yangling/Downloads/qute_download'

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = False

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '10pt monospace'

# Show a scrollbar.
# Type: Bool
c.scrolling.bar = False

# The position of the status bar.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.statusbar.position = 'bottom'

# How new tabs opened from another tab are positioned.
# Type: NewTabPosition
# Valid values:
#   - prev: Before the current tab.
#   - next: After the current tab.
#   - first: At the beginning.
#   - last: At the end.
c.tabs.new_position.related = 'next'

# The position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# Which tab to select when the focused tab is removed.
# Type: SelectOnRemove
# Valid values:
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
#   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = 'next'

# The page to open if :open -t/-b/-w is used without URL. Use
# `about:blank` for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'qute://help/index.html'

# Definitions of search engines which can be used via the address bar.
# Maps a searchengine name (such as `DEFAULT`, or `ddg`) to a URL with a
# `{}` placeholder. The placeholder will be replaced by the search term,
# use `{{` and `}}` for literal `{`/`}` signs. The searchengine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'gg': 'https://www.google.com/search?q={}', 'yd': 'http://dict.youdao.com/w/eng/{}', 'gt': 'https://translate.google.com/?hl=zh-CN&tab=wT#auto/zh-CN/{}', 'ci': 'http://www.iciba.com/{}'}

# The page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'qute://help/index.html'

# Bindings for normal mode
config.bind(',f', 'spawn --userscript readability')
config.bind(',s', 'config-write-py --force')
config.bind(',z', 'zoom 125')
config.bind('e', 'edit-url')