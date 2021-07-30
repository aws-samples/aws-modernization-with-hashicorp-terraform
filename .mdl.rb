# Enable all rules by default
all

# Extend line length, since each sentence should be on a separate line.
rule 'MD013', :line_length => 99999

# Set lines above and below for headers
rule 'MD022', :lines_above => 1
rule 'MD022', :lines_below => 1

exclude_rule 'MD001'
exclude_rule 'MD002'
exclude_rule 'MD007'
exclude_rule 'MD011'
exclude_rule 'MD026'
exclude_rule 'MD033'
exclude_rule 'MD034'
exclude_rule 'MD041'