---
name: write-thank-you-note
description: Write the thank-you note after a coffee chat, from the user's own notes on what was discussed - specific takeaways, actions already taken, thanks for concrete help, optional follow-up questions, and a promise to share progress. Drafts email (default), LinkedIn or WeChat versions for review; sending it is a separate, explicit step.
---

# Coffee Chat 感谢信

聊完之后使用，最好当天或第二天发出。根据用户自己的聊天笔记写一封具体、真诚的感谢信，让对方记住这次对话，并为之后的联系留好理由。

本 skill 只写稿。用户确认后如需发送，用 `send-alumni-outreach`（邮件），LinkedIn 和微信由用户自己发。

## 输入（按顺序问，已有的不重复问）

1. **对方是谁**：姓名、称呼、职位与公司。用过 `prepare-coffee-chat` 时直接读那份准备文档。
2. **聊天笔记（必需）**：准备文档里每个问题下记的内容和「After the chat」部分，或者用户口述的要点。没有笔记时请用户说出 2–3 条印象最深的建议。**感谢信里的每条收获都必须来自这里。**
3. **聊天的基本情况**：哪天、线上还是线下、大约多久、是否有人引荐。
4. **对方给过的具体帮助（可选）**：推荐了谁、转发了简历、愿意帮忙 mock interview、分享了资源。
5. **用户已经做了什么（可选）**：已联系对方推荐的人、已开始按建议做某件事。
6. **还想问的问题（可选）**：聊天中没说清楚、需要对方补充的事情。
7. **渠道**：邮件（默认，回复在原来的邀约邮件里，或另起主题）、LinkedIn 私信，或微信。

## 结构（邮件）

**主题**：`Thank You for the Coffee Chat`；有追问时用 `Thank You and a Few Follow-Up Questions`；也可以写具体日期，例如 `Thanks for Sunday's Coffee Chat`。回复原邮件串时保留原主题即可。

1. **感谢 + 一个具体细节**
   「Thank you again for taking the time to chat with me today!」，再加一个只属于这次对话的细节：聊了多久、线下见面、谁介绍的。接着用一句话点出聊天主题：「I really enjoyed learning about your journey from A to B.」
2. **一到两条具体收获**
   「One takeaway that especially stayed with me was your point that …」，用自己的话复述对方的观点，不照抄笔记，再说明自己打算怎么用：「I'm going to keep that in mind as I continue refining my resume and building out my projects.」第二条可以用「I also really appreciated your perspective on …」。
3. **已经采取的行动，以及对具体帮助的感谢**
   有就写，没有就跳过。例如「I've already reached out to the alumni you recommended and mentioned that you suggested I connect with them.」「Thank you as well for forwarding my resume / offering to help with mock interviews.」
4. **追问（可选）**
   最多两个，编号或用 First / Also 分开写清楚，确保对方几句话就能回答。
5. **保持联系，并约定一个分享进展的理由**
   「I'd love to stay in touch and keep you updated as I continue exploring this direction.」能具体就具体：「Once my resume and projects are in better shape, I'd love to send them your way.」也可以提一个小请求：「If I come up with a project idea, would you mind if I shared it with you for a quick perspective?」
6. **个人化的一句（可选）**
   基于聊天中对方提到的个人信息，例如祝出行顺利、祝比赛顺利。对方母语不是英语且聊天中提过时，可以用对方的语言加一句简单的谢谢，但不要勉强。
7. **落款**：`Best,` 加用户姓名；用户在 Outlook 有签名时，发送阶段再追加。

长度通常 150–250 词，比邀约邮件长，语气更温暖，感叹号控制在一到两个。

## LinkedIn 与微信版本

- **LinkedIn**：保留第 1、2、5 部分，约 60–100 词。
- **微信**（对方是中文校友时）：中文，口语一些，可以分两三条发：先感谢并点出最大的收获，再说已经做了什么或之后会同步进展。只在确认后使用「学长 / 学姐」。

## 规则

- **只写笔记里真实出现的内容。** 不为了显得具体而编造对方说过的话、推荐过的人或数字。笔记看不懂的地方先问用户。
- 复述对方的建议时，不要夸大成对方的承诺；例如对方说「可以帮你看看简历」，不要写成「谢谢你帮我内推」。
- 第一封感谢信里不主动开口要内推或职位；对方主动提出过的帮助，可以感谢并确认下一步。
- 不附简历或其他文件，除非对方明确要过。
- 提到对方推荐的人时，只写用户确实已经联系过、或明确打算联系的人。
- 对方资料没有写明代词时，不从名字推断性别。
- 不把内部笔记、要点符号或「为什么问」之类的准备内容带进正文。

## 写完之后

- 先给用户看草稿，用户改过后在同一份草稿上继续调整，保留用户认可的内容。
- 提醒用户在准备文档的「After the chat」里勾上「感谢信已发送」，并记下约定好的下一次分享进展的时间。
- 范例结构见 [examples.md](references/examples.md)。
