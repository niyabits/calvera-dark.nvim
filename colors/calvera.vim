lua << EOF
-- Source Config
-- local plugin_path = vim.fn.stdpath('config')
-- require(plugin_path .. '/init.lua')

package.loaded['calvera'] = nil
package.loaded['calvera.util'] = nil
package.loaded['calvera.colors'] = nil
package.loaded['calvera.theme'] = nil
package.loaded['calvera.functions'] = nil

vim.g.calvera_transparentbg = false
require('calvera').set()
EOF
