return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 20,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 6,
  nextobjectid = 8,
  properties = {},
  tilesets = {
    {
      name = "terrain",
      firstgid = 1,
      class = "",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "pixmaps/terrain.png",
      imagewidth = 1024,
      imageheight = 1024,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      wangsets = {},
      tilecount = 1024,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 1,
      name = "Troisième Plan ",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = -16, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302
          }
        },
        {
          x = 0, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = -16, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 302, 302, 302, 302, 302, 302, 302, 302, 302, 302,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 0, width = 16, height = 16,
          data = {
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            302, 302, 302, 302, 302, 302, 302, 302, 302, 302, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 2,
      name = "Second Plan",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {
        {
          x = -16, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92, 94, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 61, 93, 94, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92, 62, 125, 125, 126, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 125, 125, 125, 126, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 156, 157, 157, 157, 158, 0
          }
        },
        {
          x = 0, y = -16, width = 16, height = 16,
          data = {
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 802, 803, 803, 803, 804, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 834, 835, 835, 835, 836, 0, 0, 0, 0, 0, 0, 0, 0
          }
        },
        {
          x = 0, y = 0, width = 16, height = 16,
          data = {
            0, 0, 0, 834, 835, 835, 835, 836, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 866, 867, 867, 867, 868, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 898, 899, 899, 899, 900, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 5,
      name = "Premier Plan",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      chunks = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "Placements",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "Joueur",
          class = "",
          shape = "rectangle",
          x = -22.1314,
          y = 8.53844,
          width = 11.4903,
          height = 11.2211,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "Barrières",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {
        ["collidable"] = true
      },
      objects = {
        {
          id = 3,
          name = "",
          class = "",
          shape = "rectangle",
          x = 99.6906,
          y = -40.3919,
          width = 152.114,
          height = 127.191,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          class = "",
          shape = "rectangle",
          x = -149.536,
          y = -151.255,
          width = 48.9859,
          height = 137.504,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          class = "",
          shape = "rectangle",
          x = -100.55,
          y = -117.738,
          width = 57.5799,
          height = 103.988,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          class = "",
          shape = "rectangle",
          x = -176.177,
          y = -88.5184,
          width = 26.6415,
          height = 75.6274,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
