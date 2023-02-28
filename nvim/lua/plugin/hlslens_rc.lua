return function()
  require('hlslens').setup({
    override_lens = function(render, _, _, _, _)
      render.setVirt(0, 0, 0, {}, {})
    end
  })
end
