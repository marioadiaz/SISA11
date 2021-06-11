# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_18_172423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "cuit"
    t.string "rubro"
    t.string "apellido"
    t.string "nombre"
    t.string "domicilio"
    t.string "barrio"
    t.string "celular"
    t.string "telefono"
    t.string "correo"
    t.string "observaciones_cliente"
    t.string "tipo_cliente"
    t.integer "calificacion"
    t.boolean "baja"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "localidad"
  end

  create_table "orden_fumigacions", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.bigint "tecnico_id", null: false
    t.integer "nro_ordfumigacion"
    t.integer "nro_certificado"
    t.string "tipo_certificado"
    t.date "fecha_aplicacion"
    t.time "hora_aplicacion"
    t.string "tratamiento"
    t.string "vector"
    t.string "superficie"
    t.string "veneno"
    t.string "droga"
    t.string "observaciones_ordfumigacion"
    t.date "fecha_vencimiento"
    t.date "proximo_tratamiento"
    t.integer "importe"
    t.string "estado"
    t.boolean "baja"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_orden_fumigacions_on_cliente_id"
    t.index ["tecnico_id"], name: "index_orden_fumigacions_on_tecnico_id"
  end

  create_table "quejas", force: :cascade do |t|
    t.bigint "orden_fumigacion_id", null: false
    t.integer "nro_queja"
    t.date "fecha_queja"
    t.string "observaciones_queja"
    t.string "estado"
    t.boolean "baja"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["orden_fumigacion_id"], name: "index_quejas_on_orden_fumigacion_id"
  end

  create_table "tecnicos", force: :cascade do |t|
    t.string "dni"
    t.string "apellido"
    t.string "nombre"
    t.string "domicilio"
    t.string "barrio"
    t.string "celular"
    t.string "telefono"
    t.string "correo"
    t.string "observaciones_tecnico"
    t.boolean "baja"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orden_fumigacions", "clientes"
  add_foreign_key "orden_fumigacions", "tecnicos"
  add_foreign_key "quejas", "orden_fumigacions"
end
