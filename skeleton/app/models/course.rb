# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    belongs_to :instructor,
      class_name: :User,
      foreign_key: :instructor_id,
      primary_key: :id

    belongs_to :prerequisite,
      class_name: :Course,
      foreign_key: :prereq_id,
      primary_key: :id

    has_many :enrollments,
      class_name: :Enrollment,
      foreign_key: :course_id,
      primary_key: :id

    has_many :enrolled_students,
       through: :enrollments, 
        source: :user




end
#all assoss. are 2 sides. We don't always need another side for instructer id.

#has_one is for one-to-one relationships. Rare.