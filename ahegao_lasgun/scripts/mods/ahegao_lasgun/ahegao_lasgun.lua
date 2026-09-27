local mod = get_mod("ahegao_lasgun")
mod.version = "1.0.0"

-- #############################
-- Data
-- #############################
-- ###############
-- Requirements and Performance
-- ###############
local table = table
local table_insert = table.insert
local table_dump = table.dump

-- ###############
-- Mod Locals
-- ###############
local simp_ass
local current_texture
local timer

local slots = {
    "base_bc",
    "bca",
}

-- #############################
-- Helper Functions
-- #############################
local function load_ahegao_textures()
    local results_of_load_texture = simp_ass.load_textures_from_dir("mods/ahegao_lasgun/assets", false)
    if not results_of_load_texture then
        mod:error(mod:Localize("error_load_texture_fail"))
        return
    end

    local texture_paths = {} -- I love resizing arrays
    for loaded_path, loaded_data in pairs(results_of_load_texture) do
        -- where did this key come from
        if loaded_data then
            table_insert(texture_paths, loaded_path)
        end
    end
    table_dump(results_of_load_texture, "Results of loaded textures uwu", 10)
    table_dump(texture_paths, "Texture Paths found uwu", 10)

    return results_of_load_texture, texture_paths
end

local function apply_loaded_texture_to_world(current_texture)
    for _, world in pairs(Application.worlds()) do
        for _, unit in pairs(World.units(world)) do
            for mesh_index = 1, Unit.num_meshes(unit) do
                local mesh = Unit.mesh(unit, mesh_index)

                for material_index = 1, Mesh.num_materials(mesh) do
                    local material = Mesh.material(mesh, material_index)


                    for i = 1, #slots do
                        local slot = slots[i]

                        if Material.has_slot(material, slot) then
                            Material.set_resource(material, slot, current_texture)
                        end
                    end
                end
            end
        end
    end
end

local function apply_first_ahegao_to_world(results_of_load_texture, texture_paths)
    current_texture = results_of_load_texture[texture_paths[1]].texture

    --apply_loaded_texture_to_world(current_texture)
    --end
end

-- #########################################
-- Hooks
-- #########################################

-- #########################################
-- Event Executions
-- #########################################
function mod.on_all_mods_loaded()
    mod:info("v"..mod.version.." loaded uwu nya :3")

    simp_ass = get_mod("SimpleAssets")
    if not simp_ass then
        mod:error(mod:Localize("error_no_simp_ass"))
        return
    end

    local results, textures = load_ahegao_textures()
    apply_first_ahegao_to_world(results, textures)
end

function mod.on_setting_changed()
    --if mod.using_debug_mode then mod:echo("Settings changed") end
end

-- Replaces textures 
mod.update = function(dt)
    if current_texture then
        timer = timer + dt

        if timer >= 1 then
            timer = 0
            apply_loaded_texture_to_world(current_texture)
        end
    end
end