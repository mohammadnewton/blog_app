require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:second_user) { User.create(name: 'Agneta', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Doctor from India.') }
  let(:first_post) { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }
  subject { Post.new(author: first_user, title: 'Hello', text: 'This is my first post') }

  it 'should raise an error if comments_counter is negative' do
    subject.comments_counter = -1
    expect(subject).not_to be_valid
  end

  it 'should be valid when comments_counter is zero' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'should be valid when comments_counter is positive' do
    subject.comments_counter = 5
    expect(subject).to be_valid
  end

  it 'is valid with a title' do
    expect(subject).to be_valid
  end

  it 'is invalid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is valid with a title of maximum length (250 characters)' do
    title = 'A' * 250
    subject.title = title
    expect(subject).to be_valid
  end

  it 'is invalid with a title longer than 250 characters' do
    title = 'A' * 251
    subject.title = title
    expect(subject).not_to be_valid
  end

  it 'should raise an error if likes_counter is negative' do
    subject.likes_counter = -1
    expect(subject).not_to be_valid
  end

  it 'should be valid when likes_counter is zero' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it 'should be valid when likes_counter is positive' do
    subject.likes_counter = 5
    expect(subject).to be_valid
  end
end
