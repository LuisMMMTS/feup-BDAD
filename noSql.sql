-- Ir buscar o screen name do user com name "John"
db.tweets.findOne({"user.name" : "John"}, {"user.screen_name": 1})


-- Contar todos os tweets com hashtags
db.tweets.find({'entities.hashtags': { '$ne': [] }}).count()

-- Encontrar um tweet cujo texto contenha 'Renato Abreu'
db.tweets.findOne({"text" : { "$regex" : "Renato Abreu"}})

-- 100 Tweets aleatórios, ordenados pelo número de followers do criador do tweet
db.tweets.find().limit(100).sort({'user.followers_count': -1})

-- Número de nomes de utilizadores distintos na coleção. Reparem na diferença entre count() e 
-- length. Count() aplica-se a cursores. Neste caso nao temos um cursor mas sim um array de 
-- resultados, logo usamos length.
db.tweets.distinct('user.name').length

--Número de tweets com hashtag javascript
db.tweets.find({'entities.hashtags.text': 'javascript'}).count()

--Quais são a hashtags mais populares?
db.tweets.aggregate(
  [
    {
      '$group':
      {
        '_id': "$entities.hashtags.text", totalTweets:
          {
            '$sum': 1
          }
      }
    },
    {
      '$sort': {
          totalTweets: -1
      }
    }
  ]
);

-- Qual é a timezone com mais tweets? (excluindo tweets com timezone nula)
db.tweets.aggregate(
  [
    { 
        '$match': 
        {
            "user.time_zone" : { "$ne" : null }
        }
    },
    {
      '$group':
      {
        '_id': "$user.time_zone", totalTweets:
          {
            '$sum': 1
          }
      }
    },
    {
      '$sort': {
          totalTweets: -1
      }
    }
  ]
)

-- Quais os tweets com 2 mentions e 3 hashtags?
  
db.tweets.find(
  {
    "$and" :
    [
      {
        "entities.user_mentions" : {
          "$size" : 2
        }
      },
      {
        "entities.hashtags" : {
          "$size" : 3
        }
      },
    ]
  }
);


-- Existe um user que escreveu mais de 7 tweets. Qual o seu screen_name?
db.tweets.aggregate(
  [
    {
      "$group" : {
        "_id" : "$user.screen_name",
        totalTweets : {
          "$sum" : 1
        }
      }
    },
    {
      "$match": {
        totalTweets : {
          "$gt": 7
        }
      }
    }
  ]
);

-- Qual é o nome do utilizador que escreveu o tweet com o segundo maior número de hashtags?
  
db.tweets.aggregate([
    {
        "$project": {
            NumHashTags: { "$size": "$entities.hashtags" },
            "user.name": 1
        }
    },
    {
        "$sort" : { "NumHashTags" : -1 }
    },
    {
       $skip:1
    },
    {
       $limit:1
    }
]);

-- Quantos tweets existem sobre o Cristiano Ronaldo?
  
db.tweets.find({"text" : { "$regex" : "Cristiano Ronaldo"}}).count()

-- Quais são as timezones distintas no sistema, mas excluindo a timezone nula?
db.tweets.distinct("user.time_zone", { "user.time_zone" : { "$ne" : null} })  




