<template>
  <div>
    <h1>AI 텍스트 생성기</h1>
    <input v-model="prompt" placeholder="프롬프트를 입력하세요" />
    <button @click="generateText">생성하기</button>
    <div v-if="generatedText">
      <h2>생성된 텍스트:</h2>
      <p>{{ generatedText }}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      prompt: '',
      generatedText: ''
    };
  },
  methods: {
    async generateText() {
      try {
        const response = await axios.post('http://localhost:8080/api/generate', {
          prompt: this.prompt,
          maxTokens: 150,
          temperature: 0.7
        });
        this.generatedText = response.data.generatedText;
      } catch (error) {
        console.error(error);
      }
    }
  }
};
</script>

<style scoped>
/* 스타일을 여기에 추가하세요 */
</style>
