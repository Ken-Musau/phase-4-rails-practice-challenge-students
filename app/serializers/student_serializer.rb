class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :major, :instructor_id
end
