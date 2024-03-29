/* Licensed under MIT 2022. */
package io.github.ardoco.simpletracelinkdiscovery.eval;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

import org.eclipse.collections.api.factory.Lists;
import org.eclipse.collections.api.list.ImmutableList;
import org.eclipse.collections.api.list.MutableList;

public class GoldStandard {
    private final File goldStandard;

    private final MutableList<MutableList<String>> sentence2instance = Lists.mutable.empty();

    public GoldStandard(File goldStandard) {
        this.goldStandard = goldStandard;
        load();
    }

    private void load() {
        try (Scanner scan = new Scanner(goldStandard, StandardCharsets.UTF_8.name())) {
            while (scan.hasNextLine()) {
                String line = scan.nextLine();
                if (line == null || line.isBlank() || line.contains("modelElementID")) {
                    // continue if line is empty, null, or is the header (that starts with "modelElementID")
                    continue;
                }

                String[] idXline = line.strip().split(",");
                String instance = idXline[0];
                int sentence = Integer.parseInt(idXline[1]);
                while (sentence2instance.size() <= sentence) {
                    sentence2instance.add(Lists.mutable.empty());
                }
                sentence2instance.get(sentence).add(instance);
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public ImmutableList<String> getModelInstances(int sentenceNo) {
        if (sentenceNo >= sentence2instance.size()) {
            return Lists.immutable.empty();
        }
        return sentence2instance.get(sentenceNo).toImmutable();
    }

    public ImmutableList<Integer> getSentencesWithElement(String elem) {
        MutableList<Integer> sentences = Lists.mutable.empty();
        for (int i = 0; i < sentence2instance.size(); i++) {
            var instances = sentence2instance.get(i);
            if (instances.anySatisfy(e -> e.equals(elem))) {
                sentences.add(i);
            }
        }
        return sentences.toImmutable();
    }

    public int getTotalNumberOfLinks() {
        int n = 0;
        for (MutableList<String> instances : sentence2instance) {
            n += instances.size();
        }
        return n;
    }
}
