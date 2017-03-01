require 'spec_helper'

describe "Linked Documents relationship" do

  before(:each) do
    @parent_doc = FactoryGirl.create(:document, :title => 'Origin Document 1')
    @parent_doc2 = FactoryGirl.create(:document, :title => 'Origin Document 2')
    @referenced_doc = FactoryGirl.create(:document, :title => 'Referenced document 1')
    @referenced_doc2 = FactoryGirl.create(:document, :title => 'Referenced document 2')
  end

  it "should recognise when a document has no related_documents" do
    expect(@parent_doc.related_documents.count).to eq 0
  end

  it "should handle an document with a related document" do
    @parent_doc.related_documents << @referenced_doc2
    expect(@parent_doc.related_documents.count).to eq 1
  end

  # (testing 2-way fixup)
  it "should automatically know a document's related documents" do
    @parent_doc.related_documents << @referenced_doc2
    expect(@referenced_doc2.all_related.count).to eq 1
  end

  it "should handle a documents being referenced by more than one document" do
    @parent_doc.related_documents << @referenced_doc
    @parent_doc2.related_documents << @referenced_doc

    expect(@referenced_doc.all_related.count).to eq 2
  end
  it "should handle a document if related document is deleted" do
    @parent_doc.related_documents << @referenced_doc
    @parent_doc.related_documents << @referenced_doc2
    (@parent_doc.related_documents).delete(@referenced_doc2)
    expect(@referenced_doc.all_related.count).to eq 1
  end

end