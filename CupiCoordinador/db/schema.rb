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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20130915021659) do

  create_table "estudiante_materia_periodos", force: true do |t|
    t.integer  "id_estudiante"
    t.integer  "id_materia"
    t.integer  "id_semestre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estudiantes", force: true do |t|
    t.string   "stud_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materia", force: true do |t|
    t.string   "idu"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semestres", force: true do |t|
    t.string   "id_sem"
    t.datetime "created_at"
    t.datetime "updated_at"
=======
ActiveRecord::Schema.define(version: 20130914191550) do

  create_table "estudiante_materia_periodos", id: false, force: true do |t|
    t.integer "estudiante_id"
    t.integer "materia_id"
    t.integer "semestre_id"
  end

  create_table "estudiantes", force: true do |t|
    t.string "stud_id"
    t.string "name"
  end

  create_table "materias", force: true do |t|
    t.string "idu"
    t.string "nombre"
  end

  create_table "pensums", force: true do |t|
    t.string "stud_id"
    t.string "name"
  end

  create_table "semestres", force: true do |t|
    t.string "sem_id"
>>>>>>> c092df93af9c36d630613b738e9bab934d390a31
  end

end
