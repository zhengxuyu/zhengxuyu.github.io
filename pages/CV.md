---
layout: page
title: CV
permalink: /pages/CV
description: "Curriculum Vitae of Zhengxu Yu (余正旭), Research Scientist at Huawei Technologies R&D UK, working on generalisation limits of learning systems, generative code world models, and self-organising multi-agent systems."
keywords: "CV, curriculum vitae, resume, Zhengxu Yu, research scientist, Huawei, world models, reinforcement learning, multi-agent systems, generalisation"
---

<style>
.cv-download-bar {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 1.5rem;
}
.cv-download-btn {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.55rem 1.25rem;
  background: var(--color-accent);
  color: #fff !important;
  border-radius: 8px;
  font-size: 0.9rem;
  font-weight: 600;
  text-decoration: none !important;
  border-bottom: none !important;
  transition: opacity 0.2s ease;
}
.cv-download-btn:hover {
  opacity: 0.85;
  border-bottom: none !important;
}
.cv-download-btn svg {
  flex-shrink: 0;
}
</style>

<div class="cv-download-bar">
  <a class="cv-download-btn" href="/assets/ZhengxuYu-cv-20260904.pdf" download>
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
    Download PDF
  </a>
</div>

# Zhengxu Yu

**Research Scientist, Huawei Technologies R&D UK, London, United Kingdom**

**Email:** [yuzxfred@gmail.com](mailto:yuzxfred@gmail.com) &nbsp;\|&nbsp; **DBLP:** [https://dblp.org/pid/246/3155](https://dblp.org/pid/246/3155) &nbsp;\|&nbsp; **Website:** [https://zhengxuyu.github.io](https://zhengxuyu.github.io)

## Research Overview

---

My research concerns the generalisation limits of learning systems, that is, the extent to which competence acquired from finite experience extends beyond the distribution that produced it. Existing theory characterises generalisation within a fixed distribution, but for regimes absent from training no comparable account exists, and in its absence the requirements on model architecture and the objectives of training remain underdetermined. Three questions follow, namely how this boundary should be characterised over a distribution of tasks, how it can be extended, and how it can be measured on held-out environments rather than asserted.

My position is that what a policy achieves in environments outside the training distribution is determined by the form of the model it has learned of the environment dynamics, and not by the reward it was trained to maximise. I therefore study model-based formulations in which the learned dynamics are represented explicitly and revised during interaction, expressed as executable programs, corrected from the discrepancy between predicted and observed transitions, and assessed through the policy's own rollouts rather than through an externally supplied reward. Generative code world models and self-organising multi-agent systems are the environments in which these questions are currently examined.

## Education

---

- **Ph.D., Computer Science, Zhejiang University (2017 - 2021)**
    - Advisors: Prof. Deng Cai and Prof. Xiaofei He
    - Thesis: Stable Learning for Non-I.I.D Data

- **M.Sc., Computer Science, University of Surrey (2015 - 2016)**
    - Advisor: Prof. H. Lilian Tang
    - Thesis: CNN-based Mycobacterium Cells Segmentation for Time-lapse Images

- **B.Eng., Electrical Engineering, Jilin University (2011 - 2015)**

## Employment

---

***Research Scientist, Huawei Technologies R&D UK, London (2026 - Present)***

- Generative code world models: agents explore open-ended environments and encode the rules they discover as executable, self-improving code. 100% RHAE on the ARC-AGI-3 community leaderboard.
- Research and system design for OneManCompany (OMC), an open-source agentic AI platform for self-organising multi-agent systems. [https://github.com/1mancompany/OneManCompany](https://github.com/1mancompany/OneManCompany) (GitHub 400+ stars)

***Member of Technical Team, Inephany Ltd., London (2025 - 2026)***

- Multi-agent reinforcement learning infrastructure for deep learning model training, including large language models and vision transformers.

***Algorithm Expert, Apsara Lab (now Tongyi Lab), Alibaba Cloud (2024 - 2025)***

- Research on LLM post-training (reinforcement learning based methods): efficiency, alignment and agentic tool use, related work published at NeurIPS and AAAI.
- Delivering bespoke LLM agent systems with dynamic reasoning and tool use for enterprise operations-optimisation problems.
- Led a feature team, supervised research interns and junior engineers.

***Senior Algorithm Engineer, Apsara Lab (now Tongyi Lab), Alibaba Cloud (2021 - 2024)***

- Research on multi-agent reinforcement learning, related work published in IEEE TKDE and IJMLC.
- Progressive transfer learning under distribution shift, published in IEEE TIP.
- Shipped five or more large-scale commercial AI projects and proof-of-concept demos, contributing to over RMB 25M in cumulative GAAP-recognised revenue.

***Research Intern, DAMO Academy, Alibaba Group (2018 - 2021)***

- Large-scale multi-agent reinforcement learning and deep representation learning. Granted 7+ national invention patents.

## Selected Publications

---

The \* symbol denotes equal contribution.

### Peer-Reviewed Papers

- **C3.** Weihang Pan, **Zhengxu Yu**, Yong Wu, Xun Liang, Zhongming Jin, Qiang Fu, Penghui Shang, Binbin Lin, Xiaofei He, Jieping Ye. "FGD-Align: Pluralistic Alignment for Large Language Models via Fuzzy Group Decision-Making." ***AAAI Conference on Artificial Intelligence (AAAI)***, 2026.
- **C2.** Yuxiang Zhang\*, **Zhengxu Yu**\*, Weihang Pan, Zhongming Jin, Qiang Fu, Deng Cai, Binbin Lin, Jieping Ye. "TokenSqueeze: Performance-Preserving Compression for Reasoning LLMs." ***Neural Information Processing Systems (NeurIPS)***, 2025.
- **C1.** **Zhengxu Yu**, Shuxian Liang, Long Wei, Zhongming Jin, Jianqiang Huang, Deng Cai, Xiaofei He, Xian-Sheng Hua. "MaCAR: Urban Traffic Light Control via Active Multi-Agent Communication and Action Rectification." ***International Joint Conference on Artificial Intelligence (IJCAI)***, 2020.

### Journal

- **J4.** Weihang Pan, Binbin Lin, Yafei Wang, **Zhengxu Yu**, Xinkui Zhao, Xiaofei He, Jieping Ye. "Cooperative Driving at Multiple Unsignalized Intersections in Fully Autonomous Driving Scenarios." ***IEEE Transactions on Intelligent Transportation Systems (T-ITS)***, vol. 26, no. 12, 2025.
- **J3.** Chao Xiang, Zhongming Jin, **Zhengxu Yu**, Xian-Sheng Hua, Yao Hu, Wei Qian, Kaili Zhu, Deng Cai, Xiaofei He. "Optimizing Traffic Efficiency via a Reinforcement Learning Approach Based on Time Allocation." ***International Journal of Machine Learning and Cybernetics (IJMLC)***, vol. 14, no. 10, 2023.
- **J2.** Xin Guo, **Zhengxu Yu**, Pengfei Wang, Zhongming Jin, Jianqiang Huang, Deng Cai, Xiaofei He, Xian-Sheng Hua. "Urban Traffic Light Control via Active Multi-Agent Communication and Supply-Demand Modeling." ***IEEE Transactions on Knowledge and Data Engineering (TKDE)***, vol. 35, no. 4, 2023.
- **J1.** **Zhengxu Yu**, Zhongming Jin, Long Wei, Jianqiang Huang, Deng Cai, Xiaofei He, Xian-Sheng Hua. "Progressive Transfer Learning." ***IEEE Transactions on Image Processing (TIP)***, 2022.

### Technical Reports

- **P2.** Weihang Pan, **Zhengxu Yu**, Yuxiang Zhang, Zhongming Jin, Binbin Lin, Xiaofei He, Jieping Ye. "ChainPrune: Evaluating and Reducing Redundancy in Long Chain-of-Thought Reasoning." ***arXiv preprint arXiv:2608.21860***, 2026. [Paper](https://arxiv.org/abs/2608.21860).
- **P1.** **Zhengxu Yu**, Yu Fu, Zhiyuan He, Yuxuan Huang, Ka Yiu Lee, Meng Fang, Weilin Luo, Jun Wang. "OneManCompany: An Open-Source Operating System for Self-Organizing Multi-Agent Systems." ***arXiv preprint arXiv:2604.22446***, 2026. [Paper](https://arxiv.org/abs/2604.22446).

## Other Publications

---

- Liang Peng, Fei Liu, **Zhengxu Yu**, Senbo Yan, Dan Deng, Zheng Yang, Haifeng Liu, Deng Cai. "Lidar Point Cloud Guided Monocular 3D Object Detection." ***European Conference on Computer Vision (ECCV)***, 2022.
- Wenxiao Wang, **Zhengxu Yu**, Cong Fu, Deng Cai, Xiaofei He. "COP: Customized Correlation-based Filter Level Pruning Method for Deep CNN Compression." ***Neurocomputing***, vol. 464, 2021.
- **Zhengxu Yu**\*, Yang Zhao\*, Bin Hong, Zhongming Jin, Jianqiang Huang, Deng Cai, Xian-Sheng Hua. "Apparel-invariant Feature Learning for Person Re-identification." ***IEEE Transactions on Multimedia***, 2021.
- Long Wei, Zhenyong Wei, Zhongming Jin, **Zhengxu Yu**, Jianqiang Huang, Deng Cai, Xiaofei He, Xian-Sheng Hua. "SIF: Self-Inspirited Feature Learning for Person Re-Identification." ***IEEE Transactions on Image Processing (TIP)***, vol. 29, 2020.
- Liang Xie, Chao Xiang, **Zhengxu Yu**, Guodong Xu, Zheng Yang, Deng Cai, Xiaofei He. "PI-RCNN: An Efficient Multi-sensor 3D Object Detector with Point-based Attentive Cont-conv Fusion Module." ***AAAI Conference on Artificial Intelligence (AAAI)***, 2020.
- **Zhengxu Yu**, Zhongming Jin, Long Wei, Jie Guo, Jianqiang Huang, Deng Cai, Xiaofei He, Xian-Sheng Hua. "Progressive Transfer Learning for Person Re-identification." ***International Joint Conference on Artificial Intelligence (IJCAI)***, 2019.

## Awards and Honours

---

1. Outstanding Intern Award, Alibaba Group DAMO Academy (2018, 2019, 2021)
2. Outstanding Graduate Student Award, Zhejiang University (2019, 2020)

## Academic Services

---

PC Member / reviewer for top AI conferences and journals, including IEEE TIP, IEEE TMM, IEEE TCDS, NeurIPS, IJCAI, AAAI, ECCV, and ICLR.
