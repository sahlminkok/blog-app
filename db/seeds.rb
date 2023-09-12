# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
grace_bio = ['Grace, recruiter, is a technical recruiter at a large tech company. She is responsible',
  'for finding and hiring the best software engineers. She is also a great networker and',
  'is able to build relationships with potential candidates.']
clara_bio = ['Clara, software engineer, is a full-stack engineer at Google. She is passionate about building',
  'scalable and reliable software. She is also a strong advocate for diversity and inclusion in',
  'the tech industry.']
daniel_bio = ['Daniel, developer, is a freelance web developer. He is skilled in a variety of programming',
   'languages and frameworks. He is also a creative thinker and is always looking for new ways',
   'to solve problems.']
ava_bio = ['Ava, student, is a third-year computer science major at Stanford University. She is passionate',
'about using technology to solve social problems. She is also a member of the university\'s',
'robotics team and has developed a mobile app that helps people with disabilities navigate their',
'surroundings.']
tom_bio = ['Tom, student, is a senior in high school. He is undecided about his future career, but he is',
'interested in business and technology. He is also a member of the school\'s debate team and',
'is passionate about public speaking.']
henry_bio = ['Henry, student, is a first-year medical student at Harvard University. He is passionate about',
  'medicine and is committed to helping others. He is also a member of the university\'s pre-med',
  'club and is involved in several research projects.']
isabella_bio = ['Isabella, teacher, is a kindergarten teacher in San Francisco. She loves working with young',
     'children and helping them learn and grow. She is also a creative thinker and is always coming',
     'up with new ways to make learning fun.']
ben_bio = ['Ben, teacher, is a high school math teacher in New York City. He is committed to helping his students',
'succeed and has been named Teacher of the Year twice. He is also a mentor to new teachers and is',
'passionate about improving the education system.']
ethan_bio = ['Ethan, manager, is a product manager at a tech startup. He is responsible for the development and',
  'launch of new products. He is also a great communicator and is able to build consensus among',
  'stakeholders.']
luis_bio = ['Currently studying at Microverse.']
frank_bio = ['Frank, consultant, is a management consultant at McKinsey & Company. He helps businesses improve',
  'their operations and achieve their goals. He is also a strong analytical thinker and is able to',
  'identify and solve complex problems.']

User.create(name: 'Grace', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=grace', bio: grace_bio.join(' '), posts_counter: 0)
User.create(name: 'Clara', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=clara', bio: clara_bio.join(' '), posts_counter: 0)
User.create(name: 'Daniel', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=daniel', bio: daniel_bio.join(' '), posts_counter: 0)
User.create(name: 'Ava', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=ava', bio: ava_bio.join(' '), posts_counter: 0)
User.create(name: 'Tom', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=tom', bio: tom_bio.join(' '), posts_counter: 0)
User.create(name: 'Henry', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=henry', bio: henry_bio.join(' '), posts_counter: 0)
User.create(name: 'Isabella', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=isabella', bio: isabella_bio.join(' '), posts_counter: 0)
User.create(name: 'Ben', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=ben', bio: ben_bio.join(' '), posts_counter: 0)
User.create(name: 'Ethan', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=ethan', bio: ethan_bio.join(' '), posts_counter: 0)
User.create(name: 'Luis', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=luis', bio: luis_bio.join(' '), posts_counter: 0)
User.create(name: 'Frank', photo: 'https://plchldr.co/i/75?bg=252f3f&fc=ffffff&text=frank', bio: frank_bio.join(' '), posts_counter: 0)

# Posts,
# -----------------------------,
# Tom,
Post.create(author: User.find_by(name: 'Tom'), title: 'Hello friends', text: 'I joined to this awesome blog to be in touch with all of you.')

# Ben
Post.create(author: User.find_by(name: 'Ben'), title: 'Proud of My Students', text: 'My students worked so hard on their final projects and they all did a great job!')
Post.create(author: User.find_by(name: 'Ben'), title: 'Looking Forward to the New School Year', text: 'I can\'t wait to meet my new students and start a new adventure!')
Post.create(author: User.find_by(name: 'Ben'), title: 'Best Day of Teaching Career', text: 'I just had the best day of my teaching career! My students were so engaged and excited to learn.')

# Clara
Post.create(author: User.find_by(name: 'Clara'), title: 'New Software Release', text: 'The new software release was a huge success! It\'s already been adopted by hundreds of customers.')
Post.create(author: User.find_by(name: 'Clara'), title: 'AI to Improve Customer Experience', text: "I'm excited to be working on a new project that will use AI to improve the customer experience.")
Post.create(author: User.find_by(name: 'Clara'), title: 'New Website for Client', text: 'The client was really happy with the website. They said it was exactly what they were looking for.')

# Daniel
Post.create(author: User.find_by(name: 'Daniel'), title: 'Machine Learning to Improve Search', text: 'I\'m working on a new project that will use machine learning to improve the way people find information online.')

# Ethan
Post.create(author: User.find_by(name: 'Ethan'), title: 'New Product Launch', text: 'We\'re launching our new product! It\'s a new way to find and book flights, and I think it\'s going to be a huge success.')
Post.create(author: User.find_by(name: 'Ethan'), title: 'Exciting Things Planned', text: "We have a lot of exciting things planned for the next few months. I can't wait to share them with you!")
Post.create(author: User.find_by(name: 'Ethan'), title: 'Reducing Costs for Client', text: "I'm also working on a project to help a client reduce their costs. We're looking at ways to streamline their operations and eliminate waste.")
Post.create(author: User.find_by(name: 'Ethan'), title: 'Client Needs Software Engineer', text: "I'm working with a client to find a new software engineer. It's a challenging but rewarding project.")

# Frank
Post.create(author: User.find_by(name: 'Frank'), title: 'Supply Chain Efficiency', text: "I'm helping a client improve their supply chain efficiency. It's a complex project, but it's also very rewarding.")

# Grace
Post.create(author: User.find_by(name: 'Grace'), title: 'Candidate Landed Dream Job', text: "I just helped a candidate land their dream job! It's such a rewarding feeling to know that I played a role in helping them achieve their goals.")

# Henry
Post.create(author: User.find_by(name: 'Henry'), title: 'First Research Paper Published', text: 'I published a research paper! A study on the effects of exercise on cognitive function in older adults.')
Post.create(author: User.find_by(name: 'Henry'), title: 'Sleep Deprivation and Memory', text: "I'm working on a new research project that will look at the effects of sleep deprivation on memory.")

# Isabella
Post.create(author: User.find_by(name: 'Isabella'), title: 'Fractions Unit with Students', text: 'We were working on a new unit on fractions, and they were all asking great questions.')

# Jackson
Post.create(author: User.find_by(name: 'Jackson'), title: 'Debating Team Won Tournament', text: "My debating team won the tournament! We're so proud of our hard work and dedication.")
Post.create(author: User.find_by(name: 'Jackson'), title: 'Public Speaking Class', text: "I'm really enjoying my public speaking class. I'm learning about how to communicate effectively.")

# Comments
# for Clara, Post 2
Comment.create(text: "That's so exciting, Clara! I'm sure you'll do great things.", user: User.find_by(name: 'Ava'),
    post: User.find_by(name: 'Clara').posts.second)
Comment.create(text: "I'm really interested in AI too. What are you learning about?", user: User.find_by(name: 'Ben'),
    post: User.find_by(name: 'Clara').posts.second)
Comment.create(text: "I'm so impressed with your work, Clara! You're an inspiration to us all.",
    user: User.find_by(name: 'Daniel'), post: User.find_by(name: 'Clara').posts.second)
Comment.create(text: "I can't wait to see what you create next, Clara. You're a true innovator.",
    user: User.find_by(name: 'Ethan'), post: User.find_by(name: 'Clara').posts.second)
Comment.create(text: "I'm so glad you're enjoying your AI class, Clara. It's such an exciting field.",
    user: User.find_by(name: 'Frank'), post: User.find_by(name: 'Clara').posts.second)
Comment.create(text: "That's great news, Clara! I'm sure you'll make a big difference in the world.",
    user: User.find_by(name: 'Grace'), post: User.find_by(name: 'Clara').posts.second)

# for Ethan, Post 1
Comment.create(text: "Congratulations, Ethan! That's a huge accomplishment.", user: User.find_by(name: 'Ava'),
    post: User.find_by(name: 'Ethan').posts.first)
Comment.create(text: "I'm so excited for you, Ethan! I can't wait to see what you do next.",
    user: User.find_by(name: 'Ben'), post: User.find_by(name: 'Ethan').posts.first)
Comment.create(text: "That's amazing, Ethan! You must be so proud of yourself.", user: User.find_by(name: 'Daniel'),
    post: User.find_by(name: 'Ethan').posts.first)

# for Henry, Post 2
Comment.create(text: "That's incredible, Henry! Congratulations on your hard work.", user: User.find_by(name: 'Ava'),
    post: User.find_by(name: 'Henry').posts.first)
Comment.create(text: "Wow, Henry! That's a huge achievement. I'm so proud of you.", user: User.find_by(name: 'Ben'),
    post: User.find_by(name: 'Henry').posts.first)
Comment.create(text: 'Congratulations, Henry! Your research is making a real difference.',
    user: User.find_by(name: 'Daniel'), post: User.find_by(name: 'Henry').posts.first)
Comment.create(text: "That's amazing, Henry! I can't wait to read your paper.", user: User.find_by(name: 'Ethan'),
    post: User.find_by(name: 'Henry').posts.first)
Comment.create(text: "Congratulations, Henry! You're an inspiration to us all.", user: User.find_by(name: 'Frank'),
    post: User.find_by(name: 'Henry').posts.first)

# for Ben, Post 2
Comment.create(text: "That's so great, Ben! I'm sure you'll have a wonderful year.", user: User.find_by(name: 'Ava'),
    post: User.find_by(name: 'Ben').posts.second)
Comment.create(text: "I'm so excited for you, Ben! Can't wait to see what you accomplish.",
    user: User.find_by(name: 'Clara'), post: User.find_by(name: 'Ben').posts.second)
Comment.create(text: 'Congratulations, Ben! You must be so proud of yourself.', user: User.find_by(name: 'Daniel'),
    post: User.find_by(name: 'Ben').posts.second)
Comment.create(text: "That's amazing, Ben! You deserve all the success you've worked so hard for.",
    user: User.find_by(name: 'Ethan'), post: User.find_by(name: 'Ben').posts.second)
Comment.create(text: "I'm so happy for you, Ben! You're an inspiration to us all.", user: User.find_by(name: 'Frank'),
    post: User.find_by(name: 'Ben').posts.second)
Comment.create(text: "Congratulations, Ben! I'm sure you'll make a big difference in your students' lives.",
    user: User.find_by(name: 'Grace'), post: User.find_by(name: 'Ben').posts.second)
Comment.create(text: "That's awesome, Ben! I'm so proud of you.", user: User.find_by(name: 'Henry'),
    post: User.find_by(name: 'Ben').posts.second)
Comment.create(text: "Wishing you all the best, Ben! Can't wait to hear about all your adventures.",
    user: User.find_by(name: 'Isabella'), post: User.find_by(name: 'Ben').posts.second)

# Likes
Like.create(post: Post.find_by(id: 1), user: User.find_by(id: 2))
Like.create(post: Post.find_by(id: 1), user: User.find_by(id: 7))

Like.create(post: Post.find_by(id: 2), user: User.find_by(id: 1))
Like.create(post: Post.find_by(id: 2), user: User.find_by(id: 4))
Like.create(post: Post.find_by(id: 2), user: User.find_by(id: 8))
Like.create(post: Post.find_by(id: 2), user: User.find_by(id: 10))
Like.create(post: Post.find_by(id: 2), user: User.find_by(id: 6))
Like.create(post: Post.find_by(id: 2), user: User.find_by(id: 5))

Like.create(post: Post.find_by(id: 3), user: User.find_by(id: 3))
Like.create(post: Post.find_by(id: 3), user: User.find_by(id: 5))

Like.create(post: Post.find_by(id: 4), user: User.find_by(id: 6))
Like.create(post: Post.find_by(id: 4), user: User.find_by(id: 7))
Like.create(post: Post.find_by(id: 4), user: User.find_by(id: 10))
Like.create(post: Post.find_by(id: 4), user: User.find_by(id: 9))

Like.create(post: Post.find_by(id: 5), user: User.find_by(id: 1))
Like.create(post: Post.find_by(id: 5), user: User.find_by(id: 2))

Like.create(post: Post.find_by(id: 6), user: User.find_by(id: 3))
Like.create(post: Post.find_by(id: 6), user: User.find_by(id: 5))
Like.create(post: Post.find_by(id: 6), user: User.find_by(id: 8))

Like.create(post: Post.find_by(id: 7), user: User.find_by(id: 4))

Like.create(post: Post.find_by(id: 8), user: User.find_by(id: 1))
Like.create(post: Post.find_by(id: 8), user: User.find_by(id: 2))
Like.create(post: Post.find_by(id: 8), user: User.find_by(id: 5))
Like.create(post: Post.find_by(id: 8), user: User.find_by(id: 7))
Like.create(post: Post.find_by(id: 8), user: User.find_by(id: 9))
Like.create(post: Post.find_by(id: 8), user: User.find_by(id: 6))
Like.create(post: Post.find_by(id: 8), user: User.find_by(id: 8))
Like.create(post: Post.find_by(id: 8), user: User.find_by(id: 10))

Like.create(post: Post.find_by(id: 9), user: User.find_by(id: 3))

Like.create(post: Post.find_by(id: 10), user: User.find_by(id: 4))
Like.create(post: Post.find_by(id: 10), user: User.find_by(id: 7))

Like.create(post: Post.find_by(id: 11), user: User.find_by(id: 1))
Like.create(post: Post.find_by(id: 11), user: User.find_by(id: 5))
Like.create(post: Post.find_by(id: 11), user: User.find_by(id: 9))
Like.create(post: Post.find_by(id: 11), user: User.find_by(id: 2))
Like.create(post: Post.find_by(id: 11), user: User.find_by(id: 8))

Like.create(post: Post.find_by(id: 12), user: User.find_by(id: 2))
Like.create(post: Post.find_by(id: 12), user: User.find_by(id: 6))
Like.create(post: Post.find_by(id: 12), user: User.find_by(id: 8))

Like.create(post: Post.find_by(id: 13), user: User.find_by(id: 3))

Like.create(post: Post.find_by(id: 14), user: User.find_by(id: 4))
Like.create(post: Post.find_by(id: 14), user: User.find_by(id: 5))
Like.create(post: Post.find_by(id: 14), user: User.find_by(id: 6))
Like.create(post: Post.find_by(id: 14), user: User.find_by(id: 7))
Like.create(post: Post.find_by(id: 14), user: User.find_by(id: 10))

Like.create(post: Post.find_by(id: 15), user: User.find_by(id: 1))

Like.create(post: Post.find_by(id: 16), user: User.find_by(id: 3))
Like.create(post: Post.find_by(id: 16), user: User.find_by(id: 5))
Like.create(post: Post.find_by(id: 16), user: User.find_by(id: 9))
Like.create(post: Post.find_by(id: 16), user: User.find_by(id: 6))
Like.create(post: Post.find_by(id: 16), user: User.find_by(id: 8))

Like.create(post: Post.find_by(id: 17), user: User.find_by(id: 4))
Like.create(post: Post.find_by(id: 17), user: User.find_by(id: 7))
Like.create(post: Post.find_by(id: 17), user: User.find_by(id: 10))

Like.create(post: Post.find_by(id: 18), user: User.find_by(id: 1))
Like.create(post: Post.find_by(id: 18), user: User.find_by(id: 2))

Like.create(post: Post.find_by(id: 19), user: User.find_by(id: 3))
