(lambda opt [name value]
  (let [opt (view name)]
  `(tset vim.opt ,opt ,value)))

{: opt}
