# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160306134205) do

  create_table "competicao_tipos", force: :cascade do |t|
    t.string "nome", limit: 55, null: false
  end

  create_table "competicaos", force: :cascade do |t|
    t.integer "competicao_tipo_id", limit: 4,               null: false
    t.string  "nome",               limit: 55,              null: false
    t.integer "usuario_maximo",     limit: 4,  default: 10
    t.integer "usuario_minimo",     limit: 4,  default: 0
  end

  add_index "competicaos", ["competicao_tipo_id"], name: "fk1competicao", using: :btree

  create_table "equipes", force: :cascade do |t|
    t.string "nome", limit: 50, null: false
  end

  create_table "partida_detalhes", force: :cascade do |t|
    t.integer "partida_id", limit: 4, null: false
    t.integer "usuario_id", limit: 4, null: false
    t.integer "placar",     limit: 4, null: false
  end

  add_index "partida_detalhes", ["partida_id"], name: "fk1partidadetalhe", using: :btree
  add_index "partida_detalhes", ["usuario_id"], name: "fk2partidadetalhe", using: :btree

  create_table "partidas", force: :cascade do |t|
    t.integer "torneio_id", limit: 4, null: false
    t.integer "fase",       limit: 4, null: false
  end

  add_index "partidas", ["torneio_id"], name: "fk1partida", using: :btree

  create_table "restaurantes", force: :cascade do |t|
    t.string   "nome",          limit: 80
    t.string   "endereco",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "especialidade", limit: 40
  end

  create_table "torneio_competidors", force: :cascade do |t|
    t.integer "torneio_id", limit: 4,  null: false
    t.integer "usuario_id", limit: 4,  null: false
    t.float   "valor",      limit: 24
  end

  add_index "torneio_competidors", ["torneio_id"], name: "fk1torneiocompetidor", using: :btree
  add_index "torneio_competidors", ["usuario_id"], name: "fk2torneiocompetidor", using: :btree

  create_table "torneios", force: :cascade do |t|
    t.integer "competicao_id", limit: 4,  null: false
    t.string  "nome",          limit: 55, null: false
    t.float   "valor",         limit: 24
  end

  add_index "torneios", ["competicao_id"], name: "fk1torneio", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.integer "equipe_id", limit: 4
    t.string  "login",     limit: 20,  null: false
    t.string  "senha",     limit: 20,  null: false
    t.string  "email",     limit: 100, null: false
  end

  add_index "usuarios", ["equipe_id"], name: "fk1usuario", using: :btree

  add_foreign_key "competicaos", "competicao_tipos", name: "fk1competicao"
  add_foreign_key "partida_detalhes", "partidas", name: "fk1partidadetalhe"
  add_foreign_key "partida_detalhes", "usuarios", name: "fk2partidadetalhe"
  add_foreign_key "partidas", "torneios", name: "fk1partida"
  add_foreign_key "torneio_competidors", "torneios", name: "fk1torneiocompetidor"
  add_foreign_key "torneio_competidors", "usuarios", name: "fk2torneiocompetidor"
  add_foreign_key "torneios", "competicaos", name: "fk1torneio"
  add_foreign_key "usuarios", "equipes", name: "fk1usuario"
end
