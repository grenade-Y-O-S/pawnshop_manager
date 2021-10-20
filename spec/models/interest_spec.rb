require 'rails_helper'

RSpec.describe Interest, type: :model do
  before do
    @interest = FactoryBot.build(:interest)
  end

  describe '客新規登録' do
    context '新規登録できる場合' do
      it '利息回数が存在すれば登録できる' do
        expect(@interest).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'interests_numberが空では登録できない' do
        @interest.interests_number = ''
        @interest.valid?
        expect(@interest.errors.full_messages).to include "利息回数を入力してください"
      end
      it 'interests_numberが0では登録できない' do
        @interest.interests_number = 0
        @interest.valid?
        expect(@interest.errors.full_messages).to include "利息回数は0以外の値にしてください"
      end
      it 'interests_numberが半角数字以外では登録できない' do
        @interest.interests_number = '１'
        @interest.valid?
        expect(@interest.errors.full_messages).to include "利息回数は数値で入力してください"
      end
      it 'pawnが紐づいていないと登録できない' do
        @interest.pawn = nil
        @interest.valid?
        expect(@interest.errors.full_messages).to include "Pawnを入力してください"
      end
    end
  end
end
