# MQM Alumni Outreach Skills

Agent skills that help Duke Fuqua **MQM** students reach out to alumni for coffee chats: pick the right people, find their emails, write a personal email and LinkedIn message in a voice that has worked well with MQM alumni, and send from your own Duke Outlook.

They work with any coding agent that loads `SKILL.md` skills, such as **Claude Code** or **Codex**.

> 中文快速上手见 [下方](#中文快速上手)。

---

## Why this exists

The Career Management Center (CMC) shares an Excel directory of MQM alumni in the US. It already has each alum's **LinkedIn link** and basic information (name, nickname, current employer and title, location, MQM track, class year), but **no email addresses**. Emails can be looked up through **Canvas** (the Fuqua alumni directory).

Doing this by hand for every alum, then writing a thoughtful message to each, takes hours. These skills automate the tedious parts and leave the decisions to you: you confirm who to contact, review every draft, and approve every send.

The writing style comes from a real set of cold emails and LinkedIn messages that got a high reply rate from MQM alumni. It is anonymized: every fact about the sender comes from **your** resume, never from the original author.

---

## The four skills

| Skill | What it does | You provide | Output |
| --- | --- | --- | --- |
| [`match-alumni`](skills/match-alumni/SKILL.md) | Uses your own filter as-is, or picks alumni who fit your background and preferences (region, industry, company, role, class year) | Whether you already filtered; if not, your resume, optional LinkedIn export, preferences | A new **shortlist sheet** with a fit level and a one-line reason per person |
| [`collect-alumni-emails`](skills/collect-alumni-emails/SKILL.md) | Finds and verifies missing emails from LinkedIn contact info and the Fuqua alumni directory in your logged-in browser; labels school and alumni addresses | The sheet to fill | Email column filled or labeled |
| [`draft-alumni-outreach`](skills/draft-alumni-outreach/SKILL.md) | Writes one email and one LinkedIn message per person, using only facts from your resume and the sheet | Your resume, optional LinkedIn export, optional goal | `Email Content` and `LinkedIn Message` columns |
| [`send-alumni-outreach`](skills/send-alumni-outreach/SKILL.md) | Sends approved emails from your Duke Outlook and records each confirmed send. LinkedIn messages are always sent by you, by hand | Your Outlook address, whether to include your saved signature, a test address | `Sent Email` = 1 for confirmed sends |

Typical order:

```
match-alumni ──► collect-alumni-emails ──► draft-alumni-outreach ──► send-alumni-outreach
 (who to contact)   (only if many people        (email + LinkedIn         (test to yourself,
                     on the list lack emails)    message per person)        then real sends)
```

Each skill can also be used on its own.

---

## Requirements

- An agent that supports skills: Claude Code or Codex.
- Your own copy of the CMC alumni Excel (`.xlsx`) or a CSV export of it.
- Your resume (PDF, DOCX or text). Optional but recommended: your LinkedIn profile exported as PDF (your profile → **More → Save to PDF**).
- For `collect-alumni-emails`: a browser where you are already logged in to LinkedIn and Canvas / the Fuqua alumni directory.
- For `send-alumni-outreach`: your Duke Outlook account. To send **with** your saved Outlook signature, Outlook on the web logged in in your browser. To send **without** a signature, a mail connector (MCP) for your Outlook account in your agent.

---

## Install

```bash
git clone https://github.com/KimJerry114514/mqm-alumni-outreach-skills.git
cd mqm-alumni-outreach-skills
```

Copy the skills into your agent's skills folder:

```bash
mkdir -p ~/.claude/skills && cp -R skills/* ~/.claude/skills/
```

For Codex:

```bash
mkdir -p ~/.codex/skills && cp -R skills/* ~/.codex/skills/
```

Restart the agent so it picks up the new skills.

---

## Quick start

Open your agent in any folder and say something like:

> I want to reach out to MQM alumni for coffee chats. Use match-alumni to get started.

The agent then asks, one step at a time:

1. **Contact list**: the local path to your `.xlsx` or `.csv`. It lists every sheet and you pick one.
2. **Who to contact**: have you already filtered the sheet?
   - **Yes**: the visible rows are used as-is.
   - **No, pick for me**: go on to step 4.
3. **About you**: your resume, and optionally your LinkedIn PDF or pasted profile text. A bare LinkedIn URL is never scraped.
4. **Your preferences** (only if the agent picks), in your own words:
   - Which regions? (Bay Area, New York, Seattle, anywhere)
   - Which industries or companies? (fintech, consulting, a few named companies)
   - Which kinds of roles? (data science, BI, risk, consulting)
   - Any class-year range?
   - How many people?

   Skip anything you're unsure about. The agent will suggest two or three directions from your resume and let you choose.

It then builds a shortlist sheet. Mark `N` in `Keep?` for anyone you want to skip, and tell the agent to continue to emails and drafts.

Example prompts for later steps:

> Find the missing emails for the people on my shortlist.

> Write the emails and LinkedIn messages for my shortlist.

> Send a test of the first email to me at <your-email>.

> The drafts look good. Send the emails to everyone on the shortlist.

---

## What each step does in detail

### 1. Picking who to contact (`match-alumni`)

- **If you already filtered** the sheet in Excel, your filter is respected. The agent only points out duplicate people and people with no way to reach them.
- **If the agent picks**, it reads the whole sheet and matches people to you using only what's in the sheet:
  - Current employer and title.
  - Earlier roles listed as `(ex- ...)`.
  - Location, class year and track.
  - Your resume.
- It never opens alumni LinkedIn profiles to do this.
- Each person gets a fit level (**strong** or **medium**) and a reason you can check, for example: *"Moved from audit analytics at Deloitte to data analytics at Google; your accounting data analytics degree and audit-checking experience connect directly."*
- It suggests about 50% more people than you asked for, so you can trim. It keeps at most two people per company unless you name the company.
- If too few people fit, it tells you which condition is the bottleneck and offers specific ways to relax it. It never loosens your criteria on its own.
- Contact marks already in the file (`Sent Email`, `Coffee Chat`, colors) are ignored when picking. They may belong to someone else; you keep track of your own outreach.

**Shortlist sheet.** A new sheet named like `Shortlist Fiona 1110` is added to your workbook. For a CSV, a new `-shortlist` CSV is created next to it. Your original sheet is never modified.

| Column | Meaning |
| --- | --- |
| Original person columns | Name, nickname, email, LinkedIn, employer, title, location, track, class, copied as-is |
| `Source Sheet`, `Source Row` | Where the person came from, so nothing gets mixed up even when two alumni share a name |
| `Fit` | Strong or medium |
| `Match Reason` | One sentence you can verify |
| `Keep?` | Put `N` to drop someone |
| `Email Content`, `LinkedIn Message` | Filled by the drafting step |
| `Sent Email`, `Sent LinkedIn` | Your own send status, starting blank |

If the file is open in Excel, the agent asks you to close it first, or writes to a copy and tells you where it is.

### 2. Finding emails (`collect-alumni-emails`)

- Uses your logged-in browser to check LinkedIn contact info and the Fuqua alumni directory.
- Writes an email only when the source clearly belongs to the same person: name, class year and employer must match.
- School addresses (`@duke.edu`) and alumni forwarding addresses (`@alumni.duke.edu`) are labeled rather than used for cold email, since they are often not read.
- If LinkedIn shows a restriction or a CAPTCHA, it stops and saves progress. It does not try to get around limits.

> **LinkedIn caution:** viewing many profiles quickly can get your account temporarily restricted. Run this step on your shortlist, not on the whole directory, and keep batches small.

### 3. Drafting (`draft-alumni-outreach`)

- Uses **only your facts**: name, school, program, graduation date and experiences come from your resume and optional LinkedIn export. Nothing is invented. Participation is never written as leadership, and prototypes are never called production systems.
- Picks **one** experience of yours that genuinely connects to each alum's work, and asks one or two specific questions about their role and team.
- Channel rules:

| Email in the sheet | Email draft | LinkedIn message |
| --- | --- | --- |
| Verified personal email | Yes | Yes |
| School or alumni address / label | No | Yes |
| Missing | No | Yes, when the person's identity is clear |

The email shape that worked well:

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

LinkedIn messages are shorter, about 70–115 words: the same idea in a friendlier tone. They are not connection-request notes.

### 4. Sending (`send-alumni-outreach`)

- **Always test first**: the first send goes only to an address you name. A test send never marks anyone as sent.
- Before sending, the agent asks once: **do you want your saved Outlook signature?**

| Your answer | How it sends | Trade-off |
| --- | --- | --- |
| Yes, with signature | Opens each email in Outlook on the web in your browser, inserts your saved signature and sends | Slower, but identical to sending by hand |
| No, or a plain-text sign-off | Sends through a mail connector logged in as your Outlook account | Much faster; no image signature |

- It checks that the connector is logged in as **your** address before sending anything.
- Each confirmed send sets `Sent Email` = 1. Rows already marked 1 are skipped, so a rerun never double-sends.
- **LinkedIn messages are never sent automatically.** Copy them yourself, then tell the agent who you messaged so it can fill `Sent LinkedIn`.

---

## Your data and privacy

- **Never commit the CMC alumni Excel, CSV exports, resumes or send logs to GitHub.** The directory contains alumni contact information. `.gitignore` here blocks `.xlsx`, `.csv`, `.pdf`, `.docx` and JSON logs.
- Personal profiles, run logs and backups are stored outside the skills, in `~/.alumni-outreach/` (override with `ALUMNI_OUTREACH_HOME`).
- Each student should work on **their own copy** of the directory, so shortlists, drafts and send status never mix.
- The skills never extract passwords, cookies or tokens from your browser or mail client.

---

## FAQ

**Can I use a CSV instead of Excel?**
Yes. Encoding and delimiter are preserved, and the shortlist becomes a separate CSV.

**I'm not a data science person. Will the emails still fit me?**
Yes. Your direction comes from your resume and the preferences you give, not from the original author's background.

**The agent says too few alumni match.**
Pick one of the relaxations it offers: a wider region, counting earlier roles, or broader role types.

**Do I need the email step?**
Only if many people on your shortlist have no email. Otherwise you'll get LinkedIn messages for them instead.

**Can I edit drafts before sending?**
Yes. Edit `Email Content` directly in the sheet, or tell the agent what to change. The send step uses whatever is in the cell.

---

## Known limits

- `collect-alumni-emails` was written around the Fuqua alumni directory. It stores its run logs under a Codex-style folder (`~/Library/Application Support/Codex/alumni-email-runs/` on macOS).
- Personalization is only as deep as the sheet and your resume. The skills don't read alumni profiles to find team-level detail, so review each draft and add specifics you know.
- The CMC directory may be out of date (it says so in its own header). Drafts describe earlier roles as "earlier experience" when unsure.
- A reply is never guaranteed. Keep your list focused and your messages genuine.

---

## 中文快速上手

这套 skill 给 Duke Fuqua **MQM** 同学做校友 coffee chat 邀约用。CMC 整理的校友 Excel 里已有学长学姐的 **LinkedIn 链接**和基本信息（姓名、公司、职位、地点、track、毕业年份），但**没有邮箱**；邮箱可以通过 **Canvas**（Fuqua 校友目录）查到。

1. 把 `skills/` 下的四个文件夹复制到 `~/.claude/skills/`（Claude Code）或 `~/.codex/skills/`（Codex），重启 agent。
2. 对 agent 说「我想联系 MQM 校友约 coffee chat，先用 match-alumni」。
3. 按提示一步步回答：
   - 表格路径和 sheet；
   - 是否已经筛好要联系的人；
   - 你的简历，推荐再给 LinkedIn 主页导出的 PDF（主页 More → Save to PDF）；
   - 没筛好的话，用自己的话说偏好：地区、行业或公司、岗位、毕业年份、人数。
4. agent 会新建一张名单 sheet，每人附一句匹配理由。在 `Keep?` 列填 N 剔除不想联系的人。
5. 名单里很多人没邮箱时，先运行 `collect-alumni-emails` 补邮箱；然后用 `draft-alumni-outreach` 写邮件和 LinkedIn 私信。
6. 用 `send-alumni-outreach` 发送：先发给自己测试。
   - 要带 Outlook 里保存的签名：在 Outlook 网页里逐封发，较慢。
   - 不带签名：用邮件连接器直接发，较快。
   - LinkedIn 私信一律自己手动发。

注意事项：
- **不要把 CMC 的 Excel、简历或发送记录上传到 GitHub。**
- 每个人用自己的表格副本。
- 补邮箱时控制 LinkedIn 访问量，避免账号被临时限制。

---

## License

[MIT](LICENSE)
