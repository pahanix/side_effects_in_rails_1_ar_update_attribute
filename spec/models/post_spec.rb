require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post, "#update_attribute" do
  before(:each) do
    @post = Post.create :title => "Old Title", :body => "Old Body"
    @post.should_not be_new_record
  end

  # строим наше предположение

  it "should update title and should NOT update body" do
    @post.body = "New Body"
    @post.update_attribute(:title, "New Title")
    
    # делаем reload, чтобы "сбросить" body
    @post.reload
    
    @post.title.should == "New Title"
    @post.body.should == "Old Body"
  end

  # Associations
  
  it "should update title and should NOT save a valid associated comment" do
    @post.comments.should be_blank
    # добвляем коментарий в ассоциацию, но не сохраняем
    @post.comments.build :body => "Comment"
    
    @post.update_attribute(:title, "New Title")
    
    @post.reload

    @post.title.should == "New Title"

    # вместо ...should be_blank, напишем should == [], чтобы выдало что именно мы получили
    @post.comments.should == []
  end

  it "should update title and should NOT save an invalid comment" do
    @post.comments.should be_blank
    @post.comments.build :body => ""
    
    @post.update_attribute(:title, "New Title")
    
    @post.reload

    @post.title.should == "New Title"
    @post.comments.should == []
  end

  it "should update title and should NOT save any comment" do
    @post.comments.should be_blank
    @post.comments.build :body => ""        # invalid comment
    @post.comments.build :body => "Comment" # valid comment
    
    @post.update_attribute(:title, "New Title")
    
    @post.reload

    @post.title.should == "New Title"
    @post.comments.should == []
  end
  
  # updating attribute without size effects
  
  it "should update title and should NOT update body (v2)" do
    @post.body = "New Body"
    Post.update(@post, :title => "New Title")
    
    @post.reload
    
    @post.title.should == "New Title"
    @post.body.should == "Old Body"
  end
  
  

end
