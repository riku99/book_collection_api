class Book < ApplicationRecord
    belongs_to :user #自身のuser_idはUserモデルに依存することを表す
    validates :user_id, presence: true 
    default_scope -> { order(created_at: :desc) }
end
