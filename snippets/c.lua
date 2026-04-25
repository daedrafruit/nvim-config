local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("main", {
    t({ "#include <stdio.h>", "", "int main() {", "\t" }),
    i(1),
    t({ "", "}" }),
  }),
  s("print", {
    t('printf("'), i(1), t('");'),
  }),
  s("print int", {
    t('printf("%d\\n", '), i(1), t(");"),
  }),
  s("for", {
    t("for (int "), i(1, "i"), t(" = 0; "), i(2, "i"), t(" < "), i(3, "n"), t({ "; i++) {", "\t" }),
    i(4),
    t({ "", "}" }),
  }),
  s("malloc", {
    t(""), i(1, "Type"), t(" *"), i(2, "ptr"), t(" = malloc(sizeof("), i(3, "Type"), t("));"),
  }),
}
