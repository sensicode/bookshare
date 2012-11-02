# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

NestaBookshare::Application.load_tasks

task :destroy_all_subjects => :environment do
  Subject.destroy_all
  Title.all.each do |t|
    t.subjects = []
  end
end

task :update_all_titles_subjects => :environment do
  Title.all.each do |t|
    if t.subjects.count == 0
      puts "Title: %s" % t.title
      t.update_subjects
      puts
      sleep 5
    end
  end
end

task :sanity_check_titles_subjects => :environment do
  subjects_without_titles = 0
  Subject.all.each do |s|
    subjects_without_titles += 1 if s.titles.count == 0
  end
  
  puts "Total subjects: %d" % Subject.count
  puts "Subjects without titles: %d" % subjects_without_titles
  
  puts
  
  titles_without_subjects = 0
  Title.all.each do |t|
    titles_without_subjects += 1 if t.subjects.count == 0
  end
  
  puts "Total titles: %d" % Title.count
  puts "Titles without subjects: %d" % titles_without_subjects
end

task :update_titles => :environment do
  Title.update
end
