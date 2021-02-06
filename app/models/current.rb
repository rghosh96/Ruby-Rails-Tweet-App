# helps assign pertaining to the current request;
# so diff ppl logged in on have their own Current.user
class Current < ActiveSupport::CurrentAttributes
    attribute :user
end