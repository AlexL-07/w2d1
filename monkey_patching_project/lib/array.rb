# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        if self.length % 2 != 0 
            return sorted[sorted.length / 2]
        else
            sum = sorted[sorted.length / 2] + sorted[(sorted.length / 2) - 1]
            return sum / 2.0 
        end
    end

    def counts
        count = Hash.new(0)
        self.each do |el|
            count[el] += 1
        end
        count
    end

    def my_count(v)
        counter = 0 
        self.each {|el| counter += 1 if el == v}
        counter
    end

    def my_index(v)
        return nil if !self.include?(v)
        self.each_with_index do |el, i|
            return i if el == v
        end
    end 

    def my_uniq
        count = {}
        self.each {|el| count[el] = true}
        count.keys
    end

    def my_transpose
        new_arr = Array.new(self.length) {Array.new(self[0].length)}
        self.each_with_index do |subarr, i|
            subarr.each_with_index do |el, z|
                new_arr[z][i] = el
            end
        end
        new_arr
    end
end
