class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @students = []
        @teachers = []
        @grades = Hash.new {|h,k| h[k] = []}
    end

    def name 
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        if @students.include?(student)
            return true
        end
        return false
    end

    def student_to_teacher_ratio
        return @students.length / @teachers.length
    end 
    
    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            return true
        else
            return false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        return nil if @grades[student].empty?
        @grades[student].sum / num_grades(student)
    end
end
