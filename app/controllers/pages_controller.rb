class PagesController < ApplicationController
  def home
    @items = ['服', '靴', 'バッグ', '本・雑誌', '食器', '化粧品']
  end

  def question
    @item_number = params[:id]
    question_messages = {
      clothes: ["毛玉、穴あき、シミがある？", "サイズが合わない?", "１年以上着ていない?"],
      shoes: ["ボロボロ？ 破れ、色あせ、靴底に穴あきがある？", "サイズが合わない？", "１年履いていない？"],
      bags: ["見た目がボロボロ？ ほつれ、シミ、破れや変色がある？", "１年以上使っていない？", "持つとテンションが下がる？"],
      books: [
        "１年間読んでいなくて、内容が思い出せない本？", "いつかやろうと思ったまま、途中になっている資格や語学の本？",
        "また読みたいと思わない本？ （ まだ読んでいない場合 ）これから読みたいと思わない本？"
      ],
      dishes: ["カケている？ ハゲている？", "１年間使っていない？", "使えるけど、気分が上がらない食器？"],
      cosmetics: ["クサい (油っぽい臭いがする）？", "1年間使っていない？", "テンションが上がらない？"]
    }
    result_messages = {
      clothes: [
        "清潔感がないように見えるよ。",
        "サイズが合わない服は着ないよ。",
        "1年着なかった服はこれからも着ないよ。"
      ],
      shoes: [
        "清潔感がないように見えるからね。外側が汚くなくても内側が汚いと、靴を脱いだ時にバレるから気をつけてね。",
        "サイズが合わなくて、いつも靴ずれしてしまう靴。見た目は好きだけど履くと不快に感じる靴は、結局手に取らないよ。",
        "履かなかった靴は、なんらかの履かない理由があるよ。
        スポーツ用に買ったけど、結局その機会がない。以前はよく履いていたけど、もう今の気分ではない靴など。思い切って手放そう。"
      ],
      bags: [
        "どんなに高かったバッグでも、清潔感がないように見えるよ。",
        "使っていないのには理由があるよ。年齢的に似合わなくなった。可愛いいけど、重くて使いにくい。小さすぎて使いづらい。色が合わせにくいなどね。",
        "可愛くても、重くて使いづらいバッグってあるよね。手放して、代わりに使いやすいバッグを手に入れよう。"
      ],
      books: [
        "内容が思い出せなければ、その本があなたに与えた印象が薄いということだよ。買い替えられる本は、手放そう。分厚い辞書なども断捨離しようね。検索するときは、ネットを使うよね？",
        "そのいつかは、こないよ。今の自分に必要な本があればいいんだよ。",
        "また読みたいと思わなかった本(これから読みたいと思わない本)は、もう読まないよ。手放して、今の自分に必要な本を読もう。"
      ],
      dishes: [
        "食器の替え時だよ。新しいものに代えよう。",
        "１年間使っていないものは、使用用途が限られている、使いにくい、お気に入りでないなど理由があるよ。
        場所をとるから、使えても手放そう。またお客様用の食器も使わなければ、日常用として使ってしまおう。",
        "毎日、お気に入りのものを使うと気分が上がるよ。気分が上がらないものは、手放そう。"
      ],
      cosmetics: [
        "リップなどは、開封してから２年ほどすると油っぽい臭いがしてくるよ。
        まだ残量があっても、使うたびに不快な気持ちになるから、お別れしよう。
        ちなみに化粧品の消費期限は、リップやリキッドファンデは１年、粉ものだと３年くらいと言われているよ。",
        "１年間手に取らなかったものは、手に取らない理由があるよ( 色が似合わなかった、肌に合わない、使いづらいなど )。
        いつか使おうは、今使わなければ この先も使わないよ。残しておいても劣化するから、思い切って手放そう。",
        "せっかくメイクをするのだから、自分のテンションを上げてくれるものを使おう。"
      ]
    }
    item = nil

    if @item_number == '0'
      item = :clothes
    elsif @item_number == '1'
      item = :shoes
    elsif @item_number == '2'
      item = :bags
    elsif @item_number == '3'
      item = :books
    elsif @item_number == '4'
      item = :dishes
    elsif @item_number == '5'
      item = :cosmetics
    end

    @quetion_number = params[:quetion_number].to_i
    @question_message = question_messages[item][@quetion_number]
    result_number = params[:result_number].to_i
    @result_message = result_messages[item][result_number - 1]

    if @quetion_number && result_number == 0
      if @quetion_number == 0 || @quetion_number == 1 || @quetion_number == 2
        render "pages/question.html.erb"
      else
        render "pages/result_2.html.erb"
      end
    elsif result_number != 0
      render "pages/result_1.html.erb"
    else
      redirect_to root_url
    end
  end
end
