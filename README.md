# MQM Alumni Coffee Chat Skills

Six agent skills that walk Duke Fuqua **MQM** students through the whole coffee chat process with alumni:

1. **Find** the right people.
2. **Reach out** with a personal email or LinkedIn message.
3. **Prepare** for the first chat.
4. **Follow up** with a thank-you note.

You stay in control at every step. You confirm who to contact, review every draft, and approve every send.

They work with any coding agent that loads `SKILL.md` skills, such as **Claude Code** or **Codex**.

> 中文快速上手见 [下方](#中文快速上手)。

> [!WARNING]
> **LinkedIn can restrict your account if it sees high-frequency profile visits.**
> When an agent opens many LinkedIn profiles in a short time, LinkedIn may flag it as automated access and temporarily restrict your account. Repeated restrictions can last longer. This has already happened while building these skills. To avoid it:
> - Only look up people on your **shortlist**, never the whole directory.
> - Work in **small batches** with breaks in between. Don't run several agent sessions on LinkedIn at the same time.
> - If LinkedIn shows a CAPTCHA, a warning or a restriction page, **stop right away** and wait. Don't retry or try to get around it.
> - For your own profile and the profile of someone you're meeting, use **More → Save to PDF** instead of having the agent browse it.
> - No visit rate is guaranteed safe. You use LinkedIn under your own account and its terms.
>
> **LinkedIn 高频访问可能导致账号被限制（封号）。** agent 短时间内打开大量主页，会被 LinkedIn 判定为自动化访问，账号会被临时限制，多次触发可能限制更久；开发这套 skill 时就遇到过。请只查名单上的人、分小批进行；看到验证码、警告或限制页面就立刻停下，不要重试或想办法绕过。

---

## Why this exists

The Career Management Center (CMC) shares an Excel directory of MQM alumni in the US. It already has each alum's **LinkedIn link** and basic information (name, nickname, current employer and title, location, MQM track, class year), but **no email addresses**. Emails can be looked up through **Canvas** (the Fuqua alumni directory).

Turning that list into good conversations takes many hours by hand. You have to:
- choose who to contact;
- find their emails;
- write a thoughtful message to each person;
- prepare questions before each chat;
- write a thank-you note afterward.

These skills do the tedious parts. The writing patterns come from real outreach emails, prep notes and thank-you notes that got a high reply rate from MQM alumni. Everything is anonymized: every fact about you comes from **your** resume and notes, never from the original author.

### Getting the alumni directory

The directory is only available to MQM students, through Canvas (Duke login required):

1. Open the Canvas course [**MQM 2027 Careers**](https://fuqua.instructure.com/courses/4011). Other classes should use their own MQM Careers course.
2. Go to [**Pages**](https://fuqua.instructure.com/courses/4011/pages).
3. Open **Target: Research Resources - Networking With MQM Alumni**.
4. Click **"Click here for the MQM Alumni US LinkedIn directory"**.
5. Download it (**File → Download → Microsoft Excel (.xlsx)**) and save it on your computer. Give the agent that local path.

Please don't repost the directory link or file outside MQM channels, and never commit it to GitHub.

---

## The six skills at a glance

| Stage | Skill | Use it when | You give it | You get |
| --- | --- | --- | --- | --- |
| **1. Find** | [`match-alumni`](skills/match-alumni/SKILL.md) | You don't know who to contact yet | Directory path and sheet; your resume, LinkedIn PDF and preferences | A new **shortlist sheet**, with a fit level and a reason for each person |
| **1. Find** | [`collect-alumni-emails`](skills/collect-alumni-emails/SKILL.md) | Many people on your list have no email | The sheet to fill | The Email column filled in or labeled |
| **2. Reach out** | [`draft-alumni-outreach`](skills/draft-alumni-outreach/SKILL.md) | You're ready to write invitations | Your resume, optional goal | An email and a LinkedIn message for each person, in the sheet |
| **2. Reach out** | [`send-alumni-outreach`](skills/send-alumni-outreach/SKILL.md) | You've approved the drafts | Your Duke Outlook, signature yes/no, a test address | Emails sent and `Sent Email` marked |
| **3. Prepare** | [`prepare-coffee-chat`](skills/prepare-coffee-chat/SKILL.md) | Someone agreed to a **first** coffee chat | Their LinkedIn PDF, the 2–3 things you most want to learn | `Coffee Chat with <Name>.docx` prep doc |
| **4. Follow up** | [`write-thank-you-note`](skills/write-thank-you-note/SKILL.md) | The chat just ended | Your notes from the chat | A thank-you note: email, LinkedIn or WeChat |

```
 1. FIND                       2. REACH OUT                        3. PREPARE              4. FOLLOW UP
 match-alumni ─► collect- ─►   draft-alumni- ─► send-alumni- ─►    prepare-coffee- ─►      write-thank-
                 alumni-       outreach         outreach           chat                    you-note
                 emails
 who to contact  fill missing  email + LinkedIn  test to yourself,  prep doc for the        thank-you note
                 emails        per person        then real sends    first chat              within 24 hours
```

Every skill also works on its own. For example, you can use `prepare-coffee-chat` for someone you met at a career fair.

---

## Install

```bash
git clone https://github.com/KimJerry114514/mqm-alumni-outreach-skills.git
cd mqm-alumni-outreach-skills
```

Claude Code:

```bash
mkdir -p ~/.claude/skills && cp -R skills/* ~/.claude/skills/
```

Codex:

```bash
mkdir -p ~/.codex/skills && cp -R skills/* ~/.codex/skills/
```

Restart the agent so it picks up the new skills. You can call a skill by name ("use prepare-coffee-chat") or just describe what you want; the agent picks the right one.

### What you'll need

- Your own downloaded copy of the CMC directory (`.xlsx`) or a CSV export of it.
- Your resume (PDF, DOCX or text). Recommended: your LinkedIn profile as a PDF (your profile → **More → Save to PDF**).
- For finding emails: a browser where you're logged in to LinkedIn and Canvas / the Fuqua alumni directory.
- For sending: your Duke Outlook. With your saved signature you need Outlook on the web open in your browser; without it, a mail connector (MCP) for your Outlook account.
- For prep docs: Word, or any app that opens `.docx`. Markdown is used if Word output isn't available.

---

## How to use each skill

### 1. `match-alumni`: choose who to contact

**Say:** *"I want to reach out to MQM alumni for coffee chats. Use match-alumni."*

The agent asks, one step at a time:

1. The local path to your directory file, and which sheet.
2. Whether you've already filtered the sheet.
   - **Yes**: your visible rows are used as-is. It only points out duplicates and people with no way to reach them.
   - **No, pick for me**: it continues with steps 3 and 4.
3. Your resume, and optionally your LinkedIn PDF.
4. Your preferences, in your own words: regions, industries or companies, kinds of roles, class years, and how many people. Skip anything you're unsure about; it will suggest directions from your resume.

**You get** a new sheet in your workbook, named like `Shortlist Alex 1110`. For a CSV, it's a new `-shortlist` CSV. Your original sheet is never changed.

| Column | Meaning |
| --- | --- |
| Original person columns | Name, nickname, email, LinkedIn, employer, title, location, track, class |
| `Source Sheet`, `Source Row` | Where the person came from, so two alumni with the same name never get mixed up |
| `Fit` | Strong or medium |
| `Match Reason` | One sentence you can check, e.g. *"Moved from audit analytics at a Big 4 firm to data analytics in tech; your accounting data analytics degree connects directly."* |
| `Keep?` | Put `N` to drop someone |
| `Email Content`, `LinkedIn Message` | Filled in by the drafting step |
| `Sent Email`, `Sent LinkedIn` | Your own send status, starting blank |

**Tips**
- It suggests about 50% more people than you asked for, so you can trim the list.
- It keeps at most two people per company unless you name the company.
- If too few people fit, it tells you which condition is the bottleneck and offers ways to relax it. It never loosens your criteria on its own.
- Contact marks already in the file (`Sent Email`, colors) are ignored. They may be someone else's.

### 2. `collect-alumni-emails`: fill in missing emails

**Say:** *"Find the missing emails for the people on my shortlist."*

- Checks LinkedIn contact info and the Fuqua alumni directory in your logged-in browser.
- Writes an email only when name, class year and employer all match.
- School (`@duke.edu`) and alumni-forwarding (`@alumni.duke.edu`) addresses are labeled instead of used, since they're often not read.
- It stops and saves progress on any LinkedIn warning or CAPTCHA.

Run it on your **shortlist**, not the whole directory (see the LinkedIn warning above).

### 3. `draft-alumni-outreach`: write the invitations

**Say:** *"Write the emails and LinkedIn messages for my shortlist."*

- Uses **only your facts**, from your resume and LinkedIn PDF. Participation is never written as leadership, and prototypes are never called production systems.
- Picks **one** experience of yours that genuinely connects to each alum, and asks one or two specific questions about their work.
- Uses `Match Reason` from your shortlist as the starting point.

| Email in the sheet | Email draft | LinkedIn message |
| --- | --- | --- |
| Verified personal email | Yes | Yes |
| School or alumni address | No | Yes |
| Missing | No | Yes, when the person's identity is clear |

The email shape that worked well (110–160 words):

```
Subject: Coffee Chat Request from <your school/program> Student

Hi <first name or nickname>,

I'm <your name>, a current <program> student at <school>, graduating in <month year>.
I came across your profile and was especially interested in <their specific work or career move>.

<One real, related experience of yours.> I'd love to hear <one or two questions about their role or team>.

Would you be open to a 20-minute virtual coffee chat via Zoom sometime in the next two weeks?
I'd be happy to work around your schedule. Thank you for considering it!

Best,
<your name>
```

Edit drafts directly in the sheet, or tell the agent what to change.

### 4. `send-alumni-outreach`: send from your Duke Outlook

**Say:** *"Send a test of the first email to me at <your email>."* Then: *"Looks good. Send the emails to everyone on the shortlist."*

Before sending, it asks once: **do you want your saved Outlook signature?**

| Your answer | How it sends | Trade-off |
| --- | --- | --- |
| Yes, with signature | Opens each email in Outlook on the web, inserts your saved signature and sends | Slower, but identical to sending by hand |
| No, or a plain-text sign-off | Sends through a mail connector logged in as your Outlook account | Much faster; no image signature |

- It checks the connector is logged in as **your** address before anything goes out.
- Test sends never mark anyone as sent. Each confirmed real send sets `Sent Email` = 1, and rows already marked are skipped, so a rerun never double-sends.
- **LinkedIn messages are never sent automatically.** Send them yourself, then tell the agent who you messaged so it fills in `Sent LinkedIn`.

### 5. `prepare-coffee-chat`: get ready for the first chat

**Say:** *"Help me prepare for my coffee chat with <name>. Here's their LinkedIn PDF. I'm most interested in <topic 1>, <topic 2> and <topic 3>."* Add any article, blog post, talk or personal website of theirs. These usually lead to the best questions.

It also asks the format (Zoom or in person), how long, the language, and whether someone introduced you.

**You get** a Word doc, `Coffee Chat with <Name>.docx`:

- **Why this person**: their unique value compared with other alumni, narrowed to two core questions. This part is for you only.
- **Company and team brief**: so you don't spend the chat asking what's on their website.
- **Conversation arc**: one line that ties the questions together, e.g. *Their Journey → Current Work → How AI Is Changing the Role → What That Means for You → Who Else to Meet*.
- **Warm-up**: a small-talk hook from their profile, such as a hobby, a shared school or a recent event.
- **40-second elevator pitch**: built from your resume and pointed at why you wanted to talk to *them*.
- **5–7 question groups**, each with:
  - a main question grounded in something specific on their profile;
  - a follow-up;
  - a private "why ask" line;
  - a transition line to the next group.
  
  The Top 4 are starred. Sponsorship and referral questions sit under "If time allows", phrased softly.
- **Don't-ask list**, **closing script**, space for notes under each question, and an **after-chat checklist**.

**Tips**
- It's a first draft. Edit it by hand or tell the agent what to change; it revises the same doc and keeps what you've approved.
- With 20 minutes, plan on about four question groups.
- Chinese-speaking alumni can get the whole doc in Chinese.
- First chats only. By the second chat you'll know the person well enough to prepare yourself.

### 6. `write-thank-you-note`: follow up after the chat

**Say:** *"Write a thank-you note to <name> based on my notes."* If you used `prepare-coffee-chat`, the notes you took in that doc are used automatically.

It may also ask:
- the date and format of the chat, and roughly how long it was;
- any concrete help they offered, such as people to contact, forwarding your resume, or a mock interview;
- anything you've already done based on their advice;
- any follow-up questions;
- the channel: email (default), LinkedIn or WeChat.

**The structure that worked well** (150–250 words, sent the same day or the next):

1. Thanks, plus one detail unique to this chat: "nearly two hours", "meeting in person", or who introduced you.
2. One or two **specific takeaways** in your own words, and how you'll use them: *"One takeaway that especially stayed with me was your point that…"*
3. **Actions you've already taken**, such as reaching out to the people they recommended, and thanks for concrete help.
4. Optional: up to two clearly numbered follow-up questions.
5. Stay in touch, with a reason to come back: *"Once my resume and projects are in better shape, I'd love to send them your way."*

**Rules it follows**
- Every takeaway comes from your notes. Nothing is invented.
- No referral asks in the first thank-you note.
- No attachments unless they asked.

It only drafts. Use `send-alumni-outreach` or your own Outlook to send it.

---

## Your data and privacy

- **Never commit the CMC directory, CSV exports, resumes, prep docs, notes or send logs to GitHub.** They contain personal information about alumni and you. `.gitignore` here blocks `.xlsx`, `.csv`, `.pdf`, `.docx` and JSON logs.
- Personal profiles, run logs and backups are stored outside the skills, in `~/.alumni-outreach/` (override with `ALUMNI_OUTREACH_HOME`).
- Each student should work on **their own copy** of the directory, so shortlists, drafts and send status never mix.
- The skills never extract passwords, cookies or tokens from your browser or mail client.

---

## FAQ

**Can I use only the prep and thank-you skills?**
Yes. They don't need the directory. Give them the person's profile and your notes.

**Can I use a CSV instead of Excel?**
Yes. Encoding and delimiter are kept, and the shortlist becomes a separate CSV.

**I'm not a data science person. Will this still fit me?**
Yes. Your direction comes from your resume and the preferences you give, not from the original author's background.

**The agent says too few alumni match.**
Pick one of the relaxations it offers: a wider region, counting earlier roles, or broader role types.

**What if the Excel file is open?**
The agent asks you to close it first, or writes to a copy and tells you where it is.

---

## Known limits

- `collect-alumni-emails` was written around the Fuqua alumni directory. It stores its run logs under a Codex-style folder (`~/Library/Application Support/Codex/alumni-email-runs/` on macOS).
- Personalization is only as deep as what you provide. The skills don't browse alumni profiles for you, so give them the profile PDF when it matters, especially for chat prep.
- The CMC directory may be out of date (it says so in its own header). Drafts describe earlier roles as "earlier experience" when unsure.
- A reply is never guaranteed. Keep your list focused and your messages genuine.

---

## 中文快速上手

这 6 个 skill 覆盖 MQM 同学和校友 coffee chat 的完整流程：**找人 → 邀约 → 准备 → 聊完跟进**。

CMC 整理的校友 Excel 里已有学长学姐的 **LinkedIn 链接**和基本信息，但**没有邮箱**；邮箱可以通过 **Canvas**（Fuqua 校友目录）查到。

**获取校友表**（需 Duke 账号登录 Canvas）：
1. 打开 Canvas 课程 [MQM 2027 Careers](https://fuqua.instructure.com/courses/4011)（其他届用各自的 MQM Careers 课程）。
2. 进入 [Pages](https://fuqua.instructure.com/courses/4011/pages)。
3. 打开 **Target: Research Resources - Networking With MQM Alumni**。
4. 点击 **Click here for the MQM Alumni US LinkedIn directory**。
5. 选 File → Download → Microsoft Excel (.xlsx)，保存到本地，把路径告诉 agent。

请不要把表格链接或文件转发到 MQM 以外的地方。

**安装**：把 `skills/` 下的 6 个文件夹复制到 `~/.claude/skills/`（Claude Code）或 `~/.codex/skills/`（Codex），重启 agent。

**怎么用：**

| 阶段 | Skill | 对 agent 说 | 得到 |
| --- | --- | --- | --- |
| 找人 | `match-alumni` | 「我想联系 MQM 校友约 coffee chat，先用 match-alumni」 | 依次回答：表格路径和 sheet → 是否已经筛好 → 简历和 LinkedIn PDF → 偏好（地区、行业、岗位、年份、人数）。得到一张新的名单 sheet，每人附匹配理由；在 `Keep?` 列填 N 剔除 |
| 找人 | `collect-alumni-emails` | 「帮名单上没邮箱的人找邮箱」 | 只查名单上的人，分小批进行 |
| 邀约 | `draft-alumni-outreach` | 「给名单写邮件和 LinkedIn 私信」 | 每人一封邮件和一条私信，只用你简历里的事实 |
| 邀约 | `send-alumni-outreach` | 「先发一封测试到我的邮箱」，确认后「全部发送」 | 先问要不要带 Outlook 签名：带签名就在 Outlook 网页逐封发（较慢）；不带就用连接器直接发（较快）。LinkedIn 私信自己手动发 |
| 准备 | `prepare-coffee-chat` | 「帮我准备和某某的 coffee chat」，附对方 LinkedIn PDF 和你最想聊的 2–3 点 | Word 准备稿：为什么找这个人、公司背景、聊天主线、开场寒暄、40 秒自我介绍、标出 Top 4 的问题、不建议问的问题、收尾和会后清单。这是底稿，你改完它会在同一份上继续调整 |
| 跟进 | `write-thank-you-note` | 「根据我的笔记给某某写感谢信」 | 当天或第二天发：感谢加一个具体细节 → 一两条具体收获 → 已经采取的行动 → 可选追问 → 约定之后同步进展。可选邮件、LinkedIn 或微信版本 |

**注意事项：**
- **不要把 CMC 的 Excel、简历、准备稿、笔记或发送记录上传到 GitHub。**
- 每个人用自己的表格副本。
- **LinkedIn 高频访问会被限制甚至封号**：
  - 只查名单上的人，分小批、中间留间隔；
  - 不要同时开多个 agent 访问 LinkedIn；
  - 出现验证码、警告或限制页面立刻停止，不要重试；
  - 主页一律用 Save to PDF 导出，不让 agent 去浏览。

---

## License

[MIT](LICENSE)
