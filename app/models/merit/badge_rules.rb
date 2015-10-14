module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods
    def initialize
      grant_on 'assignments#complete', badge: 'dedicated-student',
      to: :user do |assignment|
      assignments.complete.count == 1
      end

      grant_on 'assignments#complete', badge: 'dedicated-learner',
      to: :user do |assignment|
      assignments.complete.count == 1
      end

      grant_on 'curriculum#complete', badge: 'coding-wizard',
      to: :user do |curriculum|
      curriculum.complete.count == 1
      end

      grant_on 'curriculum#complete', badge: 'programming-wizard',
      to: :user do |curriculum|
      curriculum.complete.count == 1
      end
    end
  end
end
