require 'despamilator'

module ActiveRecord
  module Validations
    module ClassMethods
      def validates_despamilation_of(* attr_names)
        threshold = attr_names.pop[:threshold] || raise('A threshold score must be supplied')

        configuration = {
                :message => "has exceeded the spam threshold of #{threshold}",
                :on => :save
        }

        validates_each(attr_names, configuration) do |record, attr_name, value|
          record.errors.add(attr_name, configuration[:message]) if Despamilator.new(value).score >= threshold
        end
      end
    end
  end
end
