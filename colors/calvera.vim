lua << EOF
package.loaded['calvera'] = nil
package.loaded['calvera.util'] = nil
package.loaded['calvera.colors'] = nil
package.loaded['calvera.theme'] = nil
package.loaded['calvera.functions'] = nil

require('calvera').set()
EOF
