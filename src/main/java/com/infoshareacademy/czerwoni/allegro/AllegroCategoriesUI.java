package com.infoshareacademy.czerwoni.allegro;

import com.infoshareacademy.czerwoni.parse.ParseXmlAllegroCategories;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;
import java.util.Scanner;

public class AllegroCategoriesUI {

    private static final Logger logger = LogManager.getLogger(AllegroCategoriesUI.class.getName());

    /**
     * Funkcja sterująca poruszaniem się po drzewie kategorii i generowaniem linków.
     *
     */
    public static void UserInterface() {
        List<AllegroCategory> allegroCategories = ParseXmlAllegroCategories.deserialization();
        if (!(allegroCategories.isEmpty())) {
        AllegroCategoryPrinter.printMainCategories(allegroCategories);
            boolean finished = false;
            while (!finished) {
                try {
                    System.out.print("Wprowadź komendę lub numer kategorii: ");
                    Scanner keyScanner = new Scanner(System.in);
                    String enteredKey = keyScanner.nextLine();
                    switch (enteredKey.toLowerCase()) {
                        case "main":
                            AllegroCategoryPrinter.printMainCategories(allegroCategories);
                            break;
                        case "back":
                            System.out.println("PRZEGLĄDANIE KATEGORII ALLEGRO");
                            AllegroCategoryPrinter.printParentCategories(allegroCategories);
                            break;
                        case "exit":
                            finished = true;
                            break;
                        case "generate":
                            AllegroCategoryPrinter.generateLink(allegroCategories);
                            logger.info("Generowanie linku do wybranej kategorii.");
                            break;
                        default:
                            System.out.println("PRZEGLĄDANIE KATEGORII ALLEGRO");
                            try {
                                AllegroCategoryPrinter.printChildCategories(allegroCategories, enteredKey);
                                break;
                            } catch (IndexOutOfBoundsException e) {
                                System.out.println("Wprowadzono niepoprawny numer kategorii!");
                            }
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Wprowadzono niepoprawną komendę!");
                }

            }
        }
    }
}
