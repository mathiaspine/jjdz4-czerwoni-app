package com.infoshareacademy.czerwoni.question;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.util.ArrayList;

import static com.infoshareacademy.czerwoni.parse.ParseXML.getXMLDocument;

/**
 * Klasa wspomaga czytanie dokumentu(klasa Document) XML i pozwala zapisać dane do obiektu
 */
public class QuestionReader {
    private ArrayList<Question> questionArrayList = new ArrayList<>();

    /**
     * Metoda zwraca listę wszystkich pytań i odpowiedzi - obiekty klasy Question
     * @return lista obiektó klasy Question
     */

    public ArrayList<Question> getQuestionList() {
        Document doc = getXMLDocument();
        NodeList questList = doc.getElementsByTagName("quest-item");

        for (int k = 0; k < questList.getLength(); k++) {
            Node questItem = questList.item(k);
            Element quest = (Element) questItem;
            Question question = new Question();
            question.setQuestionId(Integer.parseInt(quest.getAttribute("id")));
            question.setQuestionName(quest.getAttribute("question"));
            ArrayList<Answer> answerArrayList = new ArrayList<>();
            NodeList answerList = quest.getChildNodes();
            for (int i = 0; i < answerList.getLength(); i++) {
                Node answerItem = answerList.item(i);
                if (answerItem.getNodeType() == Node.ELEMENT_NODE) {
                    Element answer = (Element) answerItem;
                    Answer answerQ = new Answer();
                    answerQ.setAnswerId(Integer.parseInt(answer.getAttribute("id")));
                    answerQ.setAnswerName(answer.getTextContent());
                    answerQ.setRelatedQuest(Integer.parseInt(answer.getAttribute("goto-quest-id")));
                    answerArrayList.add(answerQ);
                }
            }
            question.setAnswerList(answerArrayList);
            questionArrayList.add(question);
        }
        return questionArrayList;

    }
}
